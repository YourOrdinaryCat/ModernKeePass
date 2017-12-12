﻿using System;
using System.Collections.ObjectModel;
using System.Globalization;
using System.Linq;
using System.Threading.Tasks;
using Windows.ApplicationModel.Store;
using ModernKeePass.Common;
using ModernKeePass.Interfaces;
using ModernKeePass.Services;

namespace ModernKeePass.ViewModels
{
    public class DonateVm: NotifyPropertyChangedBase
    {
        public ObservableCollection<ProductListing> Donations { get; }

        public ProductListing SelectedItem
        {
            get { return _selectedItem; }
            set { SetProperty(ref _selectedItem, value); }
        }

        private readonly ILicenseService _license;
        private ProductListing _selectedItem;

        public DonateVm() : this (new LicenseService()) { }

        public DonateVm(ILicenseService license)
        {
            // TODO: find a nice way to order products
            _license = license;
            Donations = new ObservableCollection<ProductListing>(
                _license.Products.Values
                /*.OrderBy(p => decimal.Parse(p.FormattedPrice.Replace('\u00A0', ' '), NumberStyles.Currency,
                    CultureInfo.CurrentCulture.NumberFormat))*/
                );
        }

        public async Task<int> Purchase()
        {
            return await _license.Purchase(SelectedItem.ProductId);
        }
    }
}
