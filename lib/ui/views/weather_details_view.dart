import 'dart:math';

import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_data.dart';
import 'package:weather_app/utils/colors.dart';
import 'package:weather_app/viewmodels/weather_details_view_model.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:jiffy/jiffy.dart';

class WeatherDetailsView extends StatefulWidget {
  final Daily daily;
  WeatherDetailsView({Key key, this.daily}) : super(key: key);

  @override
  _WeatherDetailsViewState createState() => _WeatherDetailsViewState();
}

class _WeatherDetailsViewState extends State<WeatherDetailsView> {
  @override
  void initState() {
    super.initState();
  }

  var _random = new Random();

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<WeatherDetailsViewModel>.withConsumer(
      viewModelBuilder: () => WeatherDetailsViewModel(),
      // onModelReady: (model) => model.getWeatherData(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: AppColors.blackShade1,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColors.blackShade1,
          title: Text('Weather Details'),
          actions: [
            Center(
                child: InkWell(
              onTap: model.signOut,
              child: Text("Sign out",
                  style: TextStyle(fontWeight: FontWeight.bold)),
            )),
            SizedBox(width: 10)
          ],
        ),
        body: Builder(
          builder: (context) {
            Daily data = widget.daily;

            DateTime dateTime =
                DateTime.fromMillisecondsSinceEpoch(data.dt * 1000);

            final List<dynamic> weatherIcon = [
              CommunityMaterialIcons.cloud,
              CommunityMaterialIcons.weather_cloudy,
              CommunityMaterialIcons.weather_night,
              CommunityMaterialIcons.weather_rainy
            ];

            return Container(
              decoration: BoxDecoration(
                  boxShadow: [
                    new BoxShadow(
                      color: Colors.grey[500],
                      blurRadius: 1.0,
                      spreadRadius: 1.0,
                    )
                  ],
                  gradient: new LinearGradient(
                      colors: [AppColors.blue_light, AppColors.red_light]),
                  color: AppColors.blue_light,
                  borderRadius: BorderRadius.circular(16.0)),
              padding: const EdgeInsets.all(16.0),
              margin: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text("${Jiffy(dateTime).yMMMMEEEEd}",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                  SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text("${data.temp.min} °C",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold)),
                          Text("Min Temp.",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 12.0)),
                        ],
                      ),
                      Icon(weatherIcon[_random.nextInt(4)],
                          color: Colors.white, size: 60.0),
                      Column(
                        children: [
                          Text("${data.temp.max} °C",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold)),
                          Text("Max Temp.",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 12.0)),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text("${data.temp.min} °C",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold)),
                          Text("Min Temp.",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 12.0)),
                        ],
                      ),
                      Icon(weatherIcon[_random.nextInt(4)],
                          color: Colors.white, size: 60.0),
                      Column(
                        children: [
                          Text("${data.temp.max} °C",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold)),
                          Text("Max Temp.",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 12.0)),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 16.0),
                  Padding(
                    padding: const EdgeInsets.only(left: 24.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Icon(CommunityMaterialIcons.wind_turbine,
                                color: Colors.white, size: 30.0),
                            SizedBox(height: 8.0),
                            Icon(CommunityMaterialIcons.cloud_outline,
                                color: Colors.white, size: 30.0),
                            SizedBox(height: 8.0),
                            Icon(CommunityMaterialIcons.water,
                                color: Colors.white, size: 30.0),
                            SizedBox(height: 8.0),
                            Icon(CommunityMaterialIcons.wind_turbine,
                                color: Colors.white, size: 30.0),
                            SizedBox(height: 8.0),
                            Icon(CommunityMaterialIcons.cloud_outline,
                                color: Colors.white, size: 30.0),
                            SizedBox(height: 8.0),
                            Icon(CommunityMaterialIcons.water,
                                color: Colors.white, size: 30.0),
                            SizedBox(height: 8.0),
                            Icon(CommunityMaterialIcons.wind_turbine,
                                color: Colors.white, size: 30.0),
                            SizedBox(height: 8.0),
                            Icon(CommunityMaterialIcons.cloud_outline,
                                color: Colors.white, size: 30.0),
                            SizedBox(height: 8.0),
                            Icon(CommunityMaterialIcons.water,
                                color: Colors.white, size: 30.0),
                          ],
                        ),
                        Column(
                          children: [
                            Text("Wind Speed",
                                style: TextStyle(color: Colors.white)),
                            SizedBox(height: 20.0),
                            Text("Cloud Percentage",
                                style: TextStyle(color: Colors.white)),
                            SizedBox(height: 20.0),
                            Text("Humidity Level",
                                style: TextStyle(color: Colors.white)),
                            SizedBox(height: 20.0),
                            Text("Wind Speed",
                                style: TextStyle(color: Colors.white)),
                            SizedBox(height: 20.0),
                            Text("Cloud Percentage",
                                style: TextStyle(color: Colors.white)),
                            SizedBox(height: 20.0),
                            Text("Humidity Level",
                                style: TextStyle(color: Colors.white)),
                            SizedBox(height: 20.0),
                            Text("Wind Speed",
                                style: TextStyle(color: Colors.white)),
                            SizedBox(height: 20.0),
                            Text("Cloud Percentage",
                                style: TextStyle(color: Colors.white)),
                            SizedBox(height: 20.0),
                            Text("Humidity Level",
                                style: TextStyle(color: Colors.white)),
                          ],
                        ),
                        Column(
                          children: [
                            Text("${data.windSpeed} km/h",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(height: 20.0),
                            Text("${data.clouds} %",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(height: 20.0),
                            Text("${data.humidity}",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(height: 20.0),
                            Text("${data.windSpeed} km/h",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(height: 20.0),
                            Text("${data.clouds} %",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(height: 20.0),
                            Text("${data.humidity}",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(height: 20.0),
                            Text("${data.windSpeed} km/h",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(height: 20.0),
                            Text("${data.clouds} %",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(height: 20.0),
                            Text("${data.humidity}",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
