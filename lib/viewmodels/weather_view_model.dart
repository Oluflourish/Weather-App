import 'package:weather_app/constants/route_names.dart';
import 'package:weather_app/locator.dart';
import 'package:weather_app/models/weather_data.dart';
import 'package:weather_app/services/api_service.dart';
import 'package:weather_app/services/authentication_service.dart';
import 'package:weather_app/services/navigation_service.dart';
import 'package:weather_app/viewmodels/base_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WeatherViewModel extends BaseModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final ApiService _apiService = locator<ApiService>();

  WeatherData weatherData;

  String location;
  double lat, lng;

  Future getWeatherData() async {
    setBusy(true);

    await getLocation();
    _apiService.getEventDetails(location, lat, lng).then((res) {
      weatherData = res;
      notifyListeners();
      setBusy(false);
    });
  }

  Future getLocation() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    location = prefs.getString('WA_LOCATION');
    lat = prefs.getDouble('WA_LAT');
    lng = prefs.getDouble('WA_LNG');

    print({location, lat, lng});
  }

  String greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'morning';
    }
    if (hour < 17) {
      return 'afternoon';
    }
    return 'evening';
  }

  Future signOut() async {
    setBusy(true);

    await _authenticationService.signOut();

    setBusy(false);
    
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('WA_isLoggenIn', false);

    _navigationService.navigateTo(SignInViewRoute);
  }

  Future navigateToHome() async {
    await _navigationService.navigateTo(HomeViewRoute);
  }

  Future navigateToWeatherDetails(int index) async {
    print(index);
    await _navigationService.navigateTo(WeatherDetailsViewRoute,
        arguments: weatherData.daily[index]);
  }
}
