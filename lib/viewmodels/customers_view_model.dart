import 'package:book_it_provider/managers/locator.dart';
import 'package:book_it_provider/models/Customers.dart';
import 'package:book_it_provider/service/cloud_storage_service.dart';
import 'package:book_it_provider/service/dialog_service.dart';
import 'package:book_it_provider/service/firestore_service.dart';
import 'package:book_it_provider/service/navigation_service.dart';
import 'package:book_it_provider/ui/route_names.dart';

import 'base_model.dart';


class CustomersViewModel extends BaseModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final FirestoreService _firestoreService = locator<FirestoreService>();
  final DialogService _dialogService = locator<DialogService>();
  final CloudStorageService _cloudStorageService =
  locator<CloudStorageService>();

  List<Customers> _customers;
  List<Customers> get customers => _customers;

  void listenToCustomers() {
    setBusy(true);

    _firestoreService.listenToCustomersRealTime().listen((customersData) {
      List<Customers> updatedCustomers = customersData;
      if (updatedCustomers != null && updatedCustomers.length > 0) {
        _customers = updatedCustomers;
        notifyListeners();
      }

      setBusy(false);
    });
  }

 Future deletePost(int index) async {
    var dialogResponse = await _dialogService.showConfirmationDialog(
      title: 'Are you sure?',
      description: 'Do you really want to delete the post?',
      confirmationTitle: 'Yes',
      cancelTitle: 'No',
    );

    if (dialogResponse.confirmed) {
      var postToDelete = _customers[index];
      setBusy(true);
      await _firestoreService.deletePost(postToDelete.documentId);
      // Delete the image after the post is deleted
  //await _cloudStorageService.deleteImage(postToDelete.imageFileName);
      setBusy(false);
    }
  }
  void editCustomers(int index) {
    _navigationService.navigateTo(CreatePostViewRoute,
        arguments: _customers[index]);
  }
  Future deleteCustomer(int index) async {
    var dialogResponse = await _dialogService.showConfirmationDialog(
      title: 'Are you sure?',
      description: 'Do you really want to delete the customer?',
      confirmationTitle: 'Yes',
      cancelTitle: 'No',
    );

    if (dialogResponse.confirmed) {
      var customerToDelete = _customers[index];
      setBusy(true);
      await _firestoreService.deleteCustomer(customerToDelete.documentId);
    }
  }

}
