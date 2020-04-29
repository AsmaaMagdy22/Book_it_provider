import 'package:book_it_provider/managers/locator.dart';
import 'package:book_it_provider/models/Customers.dart';
import 'package:book_it_provider/models/activity.dart';
import 'package:book_it_provider/service/cloud_storage_service.dart';
import 'package:book_it_provider/service/dialog_service.dart';
import 'package:book_it_provider/service/firestore_service.dart';
import 'package:book_it_provider/service/navigation_service.dart';
import 'package:book_it_provider/ui/route_names.dart';

import 'base_model.dart';


class HomeViewModel extends BaseModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final FirestoreService _firestoreService = locator<FirestoreService>();
  final DialogService _dialogService = locator<DialogService>();
  final CloudStorageService _cloudStorageService =
  locator<CloudStorageService>();

  List<Activity> _posts;
  List<Activity> get posts => _posts;

  void listenToPosts() {
    setBusy(true);

    _firestoreService.listenToPostsRealTime().listen((postsData) {
      List<Activity> updatedPosts = postsData;
      if (updatedPosts != null && updatedPosts.length > 0) {
        _posts = updatedPosts;
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
      var postToDelete = _posts[index];
      setBusy(true);
      await _firestoreService.deletePost(postToDelete.documentId);
      // Delete the image after the post is deleted
      await _cloudStorageService.deleteImage(postToDelete.imageFileName);
      setBusy(false);
    }
  }

  Future navigateToCreateView() async {
    await _navigationService.navigateTo(CreatePostViewRoute);
  }
  Future navigateToCustomerseView() async {
    await _navigationService.navigateTo(CustomersViewRoute);
  }

  void editPost(int index) {
    _navigationService.navigateTo(CreatePostViewRoute,
        arguments: _posts[index]);
  }
}
