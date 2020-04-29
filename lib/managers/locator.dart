import 'package:book_it_provider/service/authentication_service.dart';
import 'package:book_it_provider/service/cloud_storage_service.dart';
import 'package:book_it_provider/service/dialog_service.dart';
import 'package:book_it_provider/service/firestore_service.dart';
import 'package:book_it_provider/service/navigation_service.dart';
import 'package:get_it/get_it.dart';

import 'image_selector.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => FirestoreService());
  locator.registerLazySingleton(() => CloudStorageService());
  locator.registerLazySingleton(() => ImageSelector());
}
