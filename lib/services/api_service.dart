import 'dart:convert';

import 'package:weather_app/models/weather_data.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

SharedPreferences prefs;

class ApiService {
  final String apiKey = "384c56b9f94e97aae0a79a9e9a47d908";
  final String baseUrl = "https://api.openweathermap.org/data/2.5/onecall";

  Future<WeatherData> getEventDetails(
      String location, double lat, double lng) async {
    // final String url = "https://api.openweathermap.org/data/2.5/onecall?lat=33.441792&lon=-94.037689&units=metric&exclude=minutely,hourly&appid=$apiKey";
    final String url =
        "$baseUrl?lat=$lat&lon=$lng&units=metric&exclude=minutely,hourly&appid=$apiKey";
    final response = await http.get(url);

    print(url);

    var responseJson = json.decode(response.body);
    WeatherData weatherData = WeatherData.fromJson(responseJson);

    return weatherData;
  }
}
