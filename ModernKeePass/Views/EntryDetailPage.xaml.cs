﻿using Windows.UI.Xaml;
using Windows.UI.Xaml.Controls;
using Windows.UI.Xaml.Navigation;
using ModernKeePass.Common;
using ModernKeePass.Services;
using ModernKeePass.ViewModels;

// Pour en savoir plus sur le modèle d'élément Page Détail de l'élément, consultez la page http://go.microsoft.com/fwlink/?LinkId=234232

namespace ModernKeePass.Views
{
    /// <summary>
    /// Page affichant les détails d'un élément au sein d'un groupe, offrant la possibilité de
    /// consulter les autres éléments qui appartiennent au même groupe.
    /// </summary>
    public sealed partial class EntryDetailPage
    {
        public EntryVm Model => (EntryVm) DataContext;

        /// <summary>
        /// NavigationHelper est utilisé sur chaque page pour faciliter la navigation et 
        /// gestion de la durée de vie des processus
        /// </summary>
        public NavigationHelper NavigationHelper { get; }

        public EntryDetailPage()
        {
            InitializeComponent();
            NavigationHelper = new NavigationHelper(this);
        }

        #region Inscription de NavigationHelper

        /// Les méthodes fournies dans cette section sont utilisées simplement pour permettre
        /// NavigationHelper pour répondre aux méthodes de navigation de la page.
        /// 
        /// La logique spécifique à la page doit être placée dans les gestionnaires d'événements pour  
        /// <see cref="Common.NavigationHelper.LoadState"/>
        /// et <see cref="Common.NavigationHelper.SaveState"/>.
        /// Le paramètre de navigation est disponible dans la méthode LoadState 
        /// en plus de l'état de page conservé durant une session antérieure.

        protected override void OnNavigatedTo(NavigationEventArgs e)
        {
            NavigationHelper.OnNavigatedTo(e);
            if (!(e.Parameter is EntryVm)) return;
            DataContext = (EntryVm)e.Parameter;
        }

        protected override void OnNavigatedFrom(NavigationEventArgs e)
        {
            NavigationHelper.OnNavigatedFrom(e);
            Model.Reset();
        }

        #endregion
        
        private void DeleteButton_Click(object sender, RoutedEventArgs e)
        {
            var resource = new ResourcesService();
            var message = Model.IsRecycleOnDelete
                ? resource.GetResourceValue("EntryRecyclingConfirmation")
                : resource.GetResourceValue("EntryDeletingConfirmation");
            var text = Model.IsRecycleOnDelete ? resource.GetResourceValue("EntryRecycled") : resource.GetResourceValue("EntryDeleted");
            MessageDialogHelper.ShowActionDialog(resource.GetResourceValue("EntityDeleteTitle"), message,
                resource.GetResourceValue("EntityDeleteActionButton"),
                resource.GetResourceValue("EntityDeleteCancelButton"), a =>
            {
                ToastNotificationHelper.ShowMovedToast(Model, resource.GetResourceValue("EntityDeleting"), text);
                Model.MarkForDelete(resource.GetResourceValue("RecycleBinTitle"));
                if (Frame.CanGoBack) Frame.GoBack();
            }, null);
        }

        private void RestoreButton_Click(object sender, RoutedEventArgs e)
        {
            var resource = new ResourcesService();
            ToastNotificationHelper.ShowMovedToast(Model, resource.GetResourceValue("EntityRestoredTitle"), resource.GetResourceValue("EntryRestored"));
            if (Frame.CanGoBack) Frame.GoBack();
        }
        
        private void EntryDetailPage_OnSizeChanged(object sender, SizeChangedEventArgs e)
        {
            VisualStateManager.GoToState(this, e.NewSize.Width < 700 ? "Small" : "Large", true);
        }

        private void HamburgerMenuUserControl_OnSelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            var listView = sender as ListView;
            EntryVm entry;
            switch (listView?.SelectedIndex)
            {
                case -1:
                    return;
                default:
                    entry = listView?.SelectedItem as EntryVm;
                    break;
            }

            StackPanel.DataContext = entry;
        }
    }
}
