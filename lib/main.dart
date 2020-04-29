import 'package:book_it_provider/managers/router.dart';
import 'package:book_it_provider/screens/login/authenticate.dart';
import 'package:book_it_provider/service/dialog_service.dart';
import 'package:book_it_provider/service/navigation_service.dart';
import 'package:flutter/material.dart';

import 'managers/dialog_manager.dart';
import 'managers/locator.dart';


void main() {
  // Register all the models and services before the app starts
  setupLocator();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Compound',
      builder: (context, child) => Navigator(
        key: locator<DialogService>().dialogNavigationKey,
        onGenerateRoute: (settings) => MaterialPageRoute(
            builder: (context) => DialogManager(child: child)),
      ),
      navigatorKey: locator<NavigationService>().navigationKey,

      home: StartUpView(),
      onGenerateRoute: generateRoute,
    );
  }
}

/*class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
    print(user);

    // return either the Home or Authenticate widget
    if (user == null){
      return Authenticate();
    } else {
      return HomePage();
    }

  }
}*/