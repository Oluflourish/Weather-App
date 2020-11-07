import 'package:weather_app/constants/route_names.dart';
import 'package:weather_app/locator.dart';
import 'package:weather_app/models/weather_data.dart';
import 'package:weather_app/services/navigation_service.dart';
import 'package:weather_app/viewmodels/base_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeViewModel extends BaseModel {
  final NavigationService _navigationService = locator<NavigationService>();
  // SharedPreferences prefs;

  WeatherData weatherData;

  Future storeLocation(String location, double lat, double lng) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('WA_LOCATION', location);
    prefs.setDouble('WA_LAT', lat);
    prefs.setDouble('WA_LNG', lng);

    print({location, lat, lng});
  }

  Future navigateToWeatherScreen() async {
    await _navigationService.navigateTo(WeatherViewRoute);
  }
}
