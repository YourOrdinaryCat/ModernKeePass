﻿using Windows.Storage;
using ModernKeePass.ViewModels;
using ModernKeePassLib;
using ModernKeePassLib.Cryptography.KeyDerivation;
using ModernKeePassLib.Keys;

namespace ModernKeePass.Interfaces
{
    public interface IDatabase
    {
        string Name { get; }
        bool RecycleBinEnabled { get; set; }
        int Status { get; set; }
        GroupVm RootGroup { get; set; }
        GroupVm RecycleBin { get; set; }
        StorageFile DatabaseFile { get; set; }
        PwUuid DataCipher { get; set; }
        PwCompressionAlgorithm CompressionAlgorithm { get; set; }
        KdfParameters KeyDerivation { get; set; }

        void Open(CompositeKey key, bool createNew);
        void UpdateCompositeKey(CompositeKey key);
        void Save();
        void Save(StorageFile file);
        void CreateRecycleBin();
        void AddDeletedItem(PwUuid id);
        void Close();
    }
}