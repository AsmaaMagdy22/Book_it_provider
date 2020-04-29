import 'dart:io';

import 'package:book_it_provider/managers/image_selector.dart';
import 'package:book_it_provider/managers/locator.dart';
import 'package:book_it_provider/models/activity.dart';
import 'package:book_it_provider/service/cloud_storage_service.dart';
import 'package:book_it_provider/service/dialog_service.dart';
import 'package:book_it_provider/service/firestore_service.dart';
import 'package:book_it_provider/service/navigation_service.dart';
import 'package:flutter/foundation.dart';

import 'base_model.dart';

class CreatePostViewModel extends BaseModel {
  final FirestoreService _firestoreService = locator<FirestoreService>();
  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final ImageSelector _imageSelector = locator<ImageSelector>();
  final CloudStorageService _cloudStorageService =
  locator<CloudStorageService>();

  File _selectedImage;
  File get selectedImage => _selectedImage;

  Activity _edittingPost;

  bool get _editting => _edittingPost != null;

  Future selectImage() async {
    var tempImage = await _imageSelector.selectImage();
    if (tempImage != null) {
      _selectedImage = tempImage;
      notifyListeners();
    }
  }

  Future addPost({@required String name ,owner, about, location, link, number}) async {
    setBusy(true);

    CloudStorageResult storageResult;

    if (!_editting) {
      storageResult = await _cloudStorageService.uploadImage(
        imageToUpload: _selectedImage,
        name: name,
        owner: owner,
        about:about ,
        location:location ,
        link:link ,
        number:number ,

      );
    }

    var result;

    if (!_editting) {
      result = await _firestoreService.addPost(Activity(
        name: name,
        owner: owner,
        about:about ,
        location:location ,
        link:link ,
        number:number ,
        userId: currentUser.id,
        imageUrl: storageResult.imageUrl,
        imageFileName: storageResult.imageFileName,
      ));
    } else {
      result = await _firestoreService.updatePost(Activity(
        name: name,
        owner: owner,
        about:about ,
        location:location ,
        link:link ,
        number:number ,
        userId: _edittingPost.userId,
        documentId: _edittingPost.documentId,
        imageUrl: _edittingPost.imageUrl,
        imageFileName: _edittingPost.imageFileName,
      ));
    }

    setBusy(false);

    if (result is String) {
      await _dialogService.showDialog(
        title: 'Cound not create activity',
        description: result,
      );
    } else {
      await _dialogService.showDialog(
        title: 'Activity successfully Added',
        description: 'Your activity has been created',
      );
    }

    _navigationService.pop();
  }

  void setEdittingPost(Activity edittingPost) {
    _edittingPost = edittingPost;
  }
}
