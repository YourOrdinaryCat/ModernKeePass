﻿using System;
using System.Linq;
using System.Threading.Tasks;
using AutoMapper;
using ModernKeePass.Application.Common.Interfaces;
using ModernKeePass.Domain.Dtos;
using ModernKeePass.Domain.Entities;
using ModernKeePass.Domain.Enums;
using ModernKeePass.Domain.Exceptions;
using ModernKeePassLib;
using ModernKeePassLib.Cryptography.KeyDerivation;
using ModernKeePassLib.Interfaces;
using ModernKeePassLib.Keys;
using ModernKeePassLib.Security;
using ModernKeePassLib.Serialization;
using ModernKeePassLib.Utility;

namespace ModernKeePass.Infrastructure.KeePass
{
    public class KeePassDatabaseClient: IDatabaseProxy
    {
        private readonly ISettingsProxy _settings;
        private readonly IFileProxy _fileService;
        private readonly IMapper _mapper;
        private readonly PwDatabase _pwDatabase = new PwDatabase();
        private string _fileAccessToken;
        private Credentials _credentials;

        // Main information
        public bool IsOpen => (_pwDatabase?.IsOpen).GetValueOrDefault();
        public string Name => _pwDatabase?.Name;
        public GroupEntity RootGroup { get; private set; }

        // Settings
        public bool IsRecycleBinEnabled
        {
            get { return _pwDatabase.RecycleBinEnabled; }
            set { _pwDatabase.RecycleBinEnabled = value; }
        }

        public string RecycleBinId 
        {
            get 
            {
                if (_pwDatabase.RecycleBinEnabled)
                {
                    var pwGroup = _pwDatabase.RootGroup.FindGroup(_pwDatabase.RecycleBinUuid, true);
                    return pwGroup.Uuid.ToHexString();
                }

                return null;
            }
            set { _pwDatabase.RecycleBinUuid = BuildIdFromString(value); }
        }

        public string CipherId
        {
            get { return _pwDatabase.DataCipherUuid.ToHexString(); }
            set { _pwDatabase.DataCipherUuid = BuildIdFromString(value); }
        }

        public string KeyDerivationId
        {
            get { return _pwDatabase.KdfParameters.KdfUuid.ToHexString(); }
            set
            {
                _pwDatabase.KdfParameters = KdfPool.Engines
                    .FirstOrDefault(e => e.Uuid.Equals(BuildIdFromString(value)))?.GetDefaultParameters();
            }
        }

        public string Compression
        {
            get { return _pwDatabase.Compression.ToString("G"); }
            set { _pwDatabase.Compression = (PwCompressionAlgorithm) Enum.Parse(typeof(PwCompressionAlgorithm), value); }
        }
        
        public KeePassDatabaseClient(ISettingsProxy settings, IFileProxy fileService, IMapper mapper)
        {
            _settings = settings;
            _fileService = fileService;
            _mapper = mapper;
        }

        public async Task<GroupEntity> Open(FileInfo fileInfo, Credentials credentials)
        {
            try
            {
                var compositeKey = await CreateCompositeKey(credentials);
                var ioConnection = await BuildConnectionInfo(fileInfo);

                _pwDatabase.Open(ioConnection, compositeKey, new NullStatusLogger());

                _credentials = credentials;
                _fileAccessToken = fileInfo.Path;

                return _mapper.Map<GroupEntity>(_pwDatabase.RootGroup);
            }
            catch (InvalidCompositeKeyException ex)
            {
                throw new ArgumentException(ex.Message, ex);
            }
        }

        public async Task<GroupEntity> ReOpen()
        {
            return await Open(new FileInfo {Path = _fileAccessToken}, _credentials);
        }

        public async Task<GroupEntity> Create(FileInfo fileInfo, Credentials credentials)
        {
            var compositeKey = await CreateCompositeKey(credentials);
            var ioConnection = await BuildConnectionInfo(fileInfo);

            _pwDatabase.New(ioConnection, compositeKey);

            var fileFormat = _settings.GetSetting<string>("DefaultFileFormat");
            switch (fileFormat)
            {
                case "4":
                    _pwDatabase.KdfParameters = KdfPool.Get("Argon2").GetDefaultParameters();
                    break;
            }

            _fileAccessToken = fileInfo.Path;

            return _mapper.Map<GroupEntity>(_pwDatabase.RootGroup);
        }

        public async Task SaveDatabase()
        {
            if (!_pwDatabase.IsOpen) return;
            try
            {
                _pwDatabase.Save(new NullStatusLogger());
                await _fileService.WriteBinaryContentsToFile(_fileAccessToken, _pwDatabase.IOConnectionInfo.Bytes);
            }
            catch (Exception e)
            {
                throw new SaveException(e);
            }
        }

        public async Task SaveDatabase(string filePath)
        {
            try
            {
                var newFileContents = await _fileService.OpenBinaryFile(filePath);
                _pwDatabase.SaveAs(IOConnectionInfo.FromByteArray(newFileContents), true, new NullStatusLogger());
                await _fileService.WriteBinaryContentsToFile(filePath, _pwDatabase.IOConnectionInfo.Bytes);

                _fileService.ReleaseFile(_fileAccessToken);
                _fileAccessToken = filePath;
            }
            catch (Exception e)
            {
                throw new SaveException(e);
            }
        }
        
        public void CloseDatabase()
        {
            _pwDatabase?.Close();
            _fileService.ReleaseFile(_fileAccessToken);
        }

        public async Task AddEntry(string parentGroupId, string entryId)
        {
            await Task.Run(() =>
            {
                var parentPwGroup = _pwDatabase.RootGroup.FindGroup(BuildIdFromString(parentGroupId), true);
                var pwEntry = _pwDatabase.RootGroup.FindEntry(BuildIdFromString(entryId), true);
                parentPwGroup.AddEntry(pwEntry, true);
            });
        }

        public async Task InsertEntry(string parentGroupId, string entryId, int index)
        {
            await Task.Run(() =>
            {
                var parentPwGroup = _pwDatabase.RootGroup.FindGroup(BuildIdFromString(parentGroupId), true);
                var pwEntry = _pwDatabase.RootGroup.FindEntry(BuildIdFromString(entryId), true);
                parentPwGroup.Entries.Insert((uint)index, pwEntry);
            });
        }

        public async Task AddGroup(string parentGroupId, string groupId)
        {
            await Task.Run(() =>
            {
                var parentPwGroup = _pwDatabase.RootGroup.FindGroup(BuildIdFromString(parentGroupId), true);
                var pwGroup = _pwDatabase.RootGroup.FindGroup(BuildIdFromString(groupId), true);
                parentPwGroup.Groups.Add(pwGroup);
            });
        }
        public async Task RemoveEntry(string parentGroupId, string entryId)
        {
            await Task.Run(() =>
            {
                var parentPwGroup = _pwDatabase.RootGroup.FindGroup(BuildIdFromString(parentGroupId), true);
                var pwEntry = parentPwGroup.FindEntry(BuildIdFromString(entryId), false);
                parentPwGroup.Entries.Remove(pwEntry);
            });
        }

        public async Task RemoveGroup(string parentGroupId, string groupId)
        {
            await Task.Run(() =>
            {
                var parentPwGroup = _pwDatabase.RootGroup.FindGroup(BuildIdFromString(parentGroupId), true);
                var pwGroup = parentPwGroup.FindGroup(BuildIdFromString(groupId), false);
                parentPwGroup.Groups.Remove(pwGroup);
            });
        }

        public void UpdateEntry(string entryId, string fieldName, object fieldValue)
        {
            var pwEntry = _pwDatabase.RootGroup.FindEntry(BuildIdFromString(entryId), true);
            pwEntry.Touch(true);
            pwEntry.CreateBackup(null);

            switch (fieldName)
            {
                case EntryFieldName.Title:
                case EntryFieldName.UserName:
                case EntryFieldName.Password:
                case EntryFieldName.Notes:
                case EntryFieldName.Url:
                    pwEntry.Strings.Set(EntryFieldMapper.MapFieldToPwDef(fieldName), new ProtectedString(true, fieldValue.ToString()));
                    break;
                case EntryFieldName.HasExpirationDate:
                    pwEntry.Expires = (bool)fieldValue;
                    break;
                case EntryFieldName.ExpirationDate:
                    pwEntry.ExpiryTime = (DateTime)fieldValue;
                    break;
                case EntryFieldName.Icon:
                    pwEntry.IconId = IconMapper.MapIconToPwIcon((Icon)fieldValue);
                    break;
            }
        }

        public void UpdateGroup(string groupId)
        {
            throw new NotImplementedException();
        }
        
        public EntryEntity CreateEntry(string parentGroupId)
        {
            var pwEntry = new PwEntry(true, true);
            var parentPwGroup = _pwDatabase.RootGroup.FindGroup(BuildIdFromString(parentGroupId), true);
            parentPwGroup.Entries.Add(pwEntry);

            return _mapper.Map<EntryEntity>(pwEntry);
        }

        public GroupEntity CreateGroup(string parentGroupId, string name, bool isRecycleBin = false)
        {
            var pwGroup = new PwGroup(true, true, name, isRecycleBin? PwIcon.TrashBin : PwIcon.Folder);
            var parentPwGroup = _pwDatabase.RootGroup.FindGroup(BuildIdFromString(parentGroupId), true);
            parentPwGroup.Groups.Add(pwGroup);
            if (isRecycleBin) _pwDatabase.RecycleBinUuid = pwGroup.Uuid;

            return _mapper.Map<GroupEntity>(pwGroup);
        }

        public async Task DeleteEntry(string entryId)
        {
            await Task.Run(() =>
            {
                var pwEntry = _pwDatabase.RootGroup.FindEntry(BuildIdFromString(entryId), true);
                var id = pwEntry.Uuid;
                pwEntry.ParentGroup.Entries.Remove(pwEntry);

                if (!_pwDatabase.RecycleBinEnabled || pwEntry.ParentGroup.Uuid.Equals(_pwDatabase.RecycleBinUuid))
                {
                    _pwDatabase.DeletedObjects.Add(new PwDeletedObject(id, DateTime.UtcNow));
                }
            });
        }

        public async Task DeleteGroup(string groupId)
        {
            await Task.Run(() =>
            {
                var pwGroup = _pwDatabase.RootGroup.FindGroup(BuildIdFromString(groupId), true);
                var id = pwGroup.Uuid;
                pwGroup.ParentGroup.Groups.Remove(pwGroup);

                if (!_pwDatabase.RecycleBinEnabled || pwGroup.ParentGroup.Uuid.Equals(_pwDatabase.RecycleBinUuid))
                {
                    _pwDatabase.DeletedObjects.Add(new PwDeletedObject(id, DateTime.UtcNow));
                }
            });
        }

        public void SortEntries(string groupId)
        {
            var pwGroup = _pwDatabase.RootGroup.FindGroup(BuildIdFromString(groupId), true);
            var comparer = new PwEntryComparer(PwDefs.TitleField, true, false);
            pwGroup.Entries.Sort(comparer);
        }

        public void SortSubGroups(string groupId)
        {
            var pwGroup = _pwDatabase.RootGroup.FindGroup(BuildIdFromString(groupId), true);
            pwGroup.SortSubGroups(false);
        }

        public async Task UpdateCredentials(Credentials credentials)
        {
            _pwDatabase.MasterKey = await CreateCompositeKey(credentials);
        }

        private async Task<CompositeKey> CreateCompositeKey(Credentials credentials)
        {
            var compositeKey = new CompositeKey();
            if (!string.IsNullOrEmpty(credentials.Password)) compositeKey.AddUserKey(new KcpPassword(credentials.Password));
            if (!string.IsNullOrEmpty(credentials.KeyFilePath))
            {
                var kcpFileContents = await _fileService.OpenBinaryFile(credentials.KeyFilePath);
                compositeKey.AddUserKey(new KcpKeyFile(IOConnectionInfo.FromByteArray(kcpFileContents)));
            }
            return compositeKey;
        }

        private async Task<IOConnectionInfo> BuildConnectionInfo(FileInfo fileInfo)
        {
            var fileContents = await _fileService.OpenBinaryFile(fileInfo.Path);
            return IOConnectionInfo.FromByteArray(fileContents);
        }
        
        private PwUuid BuildIdFromString(string id)
        {
            return new PwUuid(MemUtil.HexStringToByteArray(id));
        }
    }
}