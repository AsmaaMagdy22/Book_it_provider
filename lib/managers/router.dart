import 'package:book_it_provider/models/activity.dart';
import 'package:book_it_provider/screens/home/create_activity.dart';
import 'package:book_it_provider/screens/home/customerList.dart';
import 'package:book_it_provider/screens/home/home.dart';
import 'package:book_it_provider/screens/login/email_register.dart';
import 'package:book_it_provider/screens/login/login.dart';
import 'package:book_it_provider/ui/route_names.dart';
import 'package:flutter/material.dart';


Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
   case LoginViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: LoginPage(),
      );
    case SignUpViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: EmailRegister(),
      );
    case HomeViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow :HomePage(),
      );
    case CustomersViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow :Customers(),
      );
    case CreatePostViewRoute:
      var postToEdit = settings.arguments as Activity;
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: CreatActivity(
          edittingPost: postToEdit,
        ),
      );
    default:
      return MaterialPageRoute(
          builder: (_) => Scaffold(
                body: Center(
                    child: Text('No route defined for ${settings.name}')),
              ));
  }
}

PageRoute _getPageRoute({String routeName, Widget viewToShow}) {
  return MaterialPageRoute(
      settings: RouteSettings(
        name: routeName,
      ),
      builder: (_) => viewToShow);
}
