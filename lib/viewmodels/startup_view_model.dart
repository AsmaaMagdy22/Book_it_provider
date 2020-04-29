

import 'package:book_it_provider/managers/locator.dart';
import 'package:book_it_provider/service/authentication_service.dart';
import 'package:book_it_provider/service/navigation_service.dart';
import 'package:book_it_provider/ui/route_names.dart';

import 'base_model.dart';

class StartUpViewModel extends BaseModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final NavigationService _navigationService = locator<NavigationService>();

  Future handleStartUpLogic() async {
    var hasLoggedInUser = await _authenticationService.isUserLoggedIn();

    if (hasLoggedInUser) {
      _navigationService.navigateTo(HomeViewRoute);
    } else {
      _navigationService.navigateTo(LoginViewRoute);
    }
  }
}
