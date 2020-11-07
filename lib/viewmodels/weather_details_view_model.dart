import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/constants/route_names.dart';
import 'package:weather_app/locator.dart';
import 'package:weather_app/services/authentication_service.dart';
import 'package:weather_app/services/navigation_service.dart';
import 'package:weather_app/viewmodels/base_model.dart';

class WeatherDetailsViewModel extends BaseModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final NavigationService _navigationService = locator<NavigationService>();

  Future navigateToHome() async {
    await _navigationService.navigateTo(HomeViewRoute);
  }

  Future signOut() async {
    setBusy(true);

    await _authenticationService.signOut();

    setBusy(false);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('WA_isLoggenIn', false);

    _navigationService.navigateTo(SignInViewRoute);
  }
}
