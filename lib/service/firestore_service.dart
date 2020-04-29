import 'dart:async';

import 'package:book_it_provider/models/Customers.dart';
import 'package:book_it_provider/models/activity.dart';
import 'package:book_it_provider/models/uesr.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';

class FirestoreService {
  final CollectionReference _usersCollectionReference =
      Firestore.instance.collection('users');
  final CollectionReference _postsCollectionReference =
      Firestore.instance.collection('provider');
  final CollectionReference _customersCollectionReference =
  Firestore.instance.collection('customers');

  final StreamController<List<Activity>> _postsController =
      StreamController<List<Activity>>.broadcast();
  final StreamController<List<Customers>> _customersController =
  StreamController<List<Customers>>.broadcast();

  Future createUser(User user) async {
    try {
      await _usersCollectionReference.document(user.id).setData(user.toJson());
    } catch (e) {
      // TODO: Find or create a way to repeat error handling without so much repeated code
      if (e is PlatformException) {
        return e.message;
      }

      return e.toString();
    }
  }

  Future getUser(String uid) async {
    try {
      var userData = await _usersCollectionReference.document(uid).get();
      return User.fromData(userData.data);
    } catch (e) {
      // TODO: Find or create a way to repeat error handling without so much repeated code
      if (e is PlatformException) {
        return e.message;
      }

      return e.toString();
    }
  }

  Future addPost(Activity activity) async {
    try {
      await _postsCollectionReference.add(activity.toMap());
    } catch (e) {
      // TODO: Find or create a way to repeat error handling without so much repeated code
      if (e is PlatformException) {
        return e.message;
      }

      return e.toString();
    }
  }
  Future getPostsOnceOff() async {
    try {
      var postDocumentSnapshot = await _postsCollectionReference.getDocuments();
      if (postDocumentSnapshot.documents.isNotEmpty) {
        return postDocumentSnapshot.documents
            .map((snapshot) => Activity.fromMap(snapshot.data, snapshot.documentID))
            .where((mappedItem) => mappedItem.name != null)
            .toList();
      }
    } catch (e) {
      // TODO: Find or create a way to repeat error handling without so much repeated code
      if (e is PlatformException) {
        return e.message;
      }

      return e.toString();
    }
  }

  Stream listenToPostsRealTime() {
    // Register the handler for when the posts data changes
    _postsCollectionReference.snapshots().listen((postsSnapshot) {
      if (postsSnapshot.documents.isNotEmpty) {
        var posts = postsSnapshot.documents
            .map((snapshot) => Activity.fromMap(snapshot.data, snapshot.documentID))
            .where((mappedItem) => mappedItem.name != null)
            .toList();

        // Add the posts onto the controller
        _postsController.add(posts);
      }
    });

    return _postsController.stream;
  }

  Future deletePost(String documentId) async {
    await _postsCollectionReference.document(documentId).delete();
  }

  Future updatePost(Activity activity) async {
    try {
      await _postsCollectionReference
          .document(activity.documentId)
          .updateData(activity.toMap());
    } catch (e) {
      // TODO: Find or create a way to repeat error handling without so much repeated code
      if (e is PlatformException) {
        return e.message;
      }

      return e.toString();
    }
  }

  // for customers

  Future getActivity(String activityId) async {
    try {
      var userData = await _postsCollectionReference.document(activityId).get();
      return Activity.fromMap(userData.data, userData.documentID);
    } catch (e) {
      // TODO: Find or create a way to repeat error handling without so much repeated code
      if (e is PlatformException) {
        return e.message;
      }

      return e.toString();
    }
  }

 /* Future addPost(Activity activity) async {
    try {
      await _postsCollectionReference.add(activity.toMap());
    } catch (e) {
      // TODO: Find or create a way to repeat error handling without so much repeated code
      if (e is PlatformException) {
        return e.message;
      }

      return e.toString();
    }
  }*/


  Future getCustomersOnceOff() async {
    try {
      var customerDocumentSnapshot = await _customersCollectionReference.getDocuments();
      if (customerDocumentSnapshot.documents.isNotEmpty) {
        return customerDocumentSnapshot.documents
            .map((snapshot) => Customers.fromMap(snapshot.data, snapshot.documentID))
            .where((mappedItem) => mappedItem.custName != null)
            .toList();
      }
    } catch (e) {
      // TODO: Find or create a way to repeat error handling without so much repeated code
      if (e is PlatformException) {
        return e.message;
      }

      return e.toString();
    }
  }

  Stream listenToCustomersRealTime() {
    // Register the handler for when the posts data changes
    _customersCollectionReference.snapshots().listen((postsSnapshot) {
      if (postsSnapshot.documents.isNotEmpty) {
        var customers = postsSnapshot.documents
            .map((snapshot) => Customers.fromMap(snapshot.data, snapshot.documentID))
            .where((mappedItem) => mappedItem.custName != null)
            .toList();

        // Add the posts onto the controller
        _customersController.add(customers);
      }
    });

    return _customersController.stream;
  }
  Future deleteCustomer(String documentId) async {
    await _customersCollectionReference.document(documentId).delete();
  }
}
