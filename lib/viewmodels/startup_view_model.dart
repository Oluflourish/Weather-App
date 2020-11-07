import 'dart:async';

import 'package:weather_app/constants/route_names.dart';
import 'package:weather_app/locator.dart';
import 'package:weather_app/services/navigation_service.dart';
import 'package:weather_app/viewmodels/base_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StartUpViewModel extends BaseModel {
  // final AuthenticationService _authenticationService =locator<AuthenticationService>();
  final NavigationService _navigationService = locator<NavigationService>();

  bool hasLoggedInUser = false;

  Future handleStartUpLogic() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // var userAuthId = prefs.getString('WA_userAuthId');
    try {
      hasLoggedInUser = prefs.getBool('WA_isLoggenIn');
      print("try: " + hasLoggedInUser.toString());
    } catch (e) {
      hasLoggedInUser = false;
      print("caught: " + hasLoggedInUser.toString());
    }

    if (hasLoggedInUser != null && hasLoggedInUser) {
      _navigationService.navigateReplacementTo(WeatherViewRoute);
    } else {
      _navigationService.navigateReplacementTo(SignInViewRoute);
    }
  }
}
