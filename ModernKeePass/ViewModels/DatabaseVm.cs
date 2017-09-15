﻿using System.ComponentModel;
using Windows.Storage;

using ModernKeePassLib;
using ModernKeePassLib.Keys;
using ModernKeePassLib.Serialization;
using ModernKeePassLib.Interfaces;

namespace ModernKeePass.ViewModels
{
    public class DatabaseVm : INotifyPropertyChanged
    {
        private PwDatabase _database = new PwDatabase();

        public string Name { get; set; }
        public GroupVm RootGroup { get; set; }

        public event PropertyChangedEventHandler PropertyChanged;

        public async void Open(StorageFile databaseFile, string password)
        {
            var key = new CompositeKey();
            key.AddUserKey(new KcpPassword(password));
            try
            {
                await _database.Open(IOConnectionInfo.FromFile(databaseFile), key, new NullStatusLogger());
                if (!_database.IsOpen) return;
                Name = databaseFile.DisplayName;
                RootGroup = new GroupVm (_database.RootGroup);
            }
            finally
            {
                _database.Close();
            }
        }
    }
}
