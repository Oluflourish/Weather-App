import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_place/google_place.dart';
import 'package:weather_app/utils/colors.dart';
import 'package:weather_app/viewmodels/home_view_model.dart';
import 'package:provider_architecture/provider_architecture.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  GooglePlace googlePlace;
  List<AutocompletePrediction> predictions = [];

  void autoCompleteSearch(String value) async {
    var result = await googlePlace.autocomplete.get(value);
    if (result != null && result.predictions != null && mounted) {
      setState(() {
        predictions = result.predictions;
      });
    }
  }

  @override
  void initState() {
    String apiKey = "";
    googlePlace = GooglePlace(apiKey);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<HomeViewModel>.withConsumer(
      viewModelBuilder: () => HomeViewModel(),
      // onModelReady: (model) => model.getWeatherData(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: AppColors.blackShade1,
        // appBar: AppBar(
        //   backgroundColor: AppColors.blackShade1,
        //   centerTitle: true,
        //   title: Text('Home'),
        // ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 16.0),
                  Icon(CommunityMaterialIcons.weather_partlycloudy,
                      color: Colors.white, size: 120.0),
                  SizedBox(height: 16.0),
                  Text("Search Weather Data ",
                      style: TextStyle(color: Colors.white, fontSize: 24.0)),
                  SizedBox(height: 36.0),
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
                    decoration: InputDecoration(
                      hintText: "Enter City",
                      hintStyle: TextStyle(fontSize: 18.0),
                      prefixIcon: Icon(Icons.search),
                      contentPadding: EdgeInsets.all(12.0),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(color: Colors.white, width: 0.0),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(color: Colors.white, width: 1.0),
                      ),
                      filled: true,
                      fillColor: AppColors.grey,
                    ),
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        autoCompleteSearch(value);
                      } else {
                        if (predictions.length > 0 && mounted) {
                          setState(() {
                            predictions = [];
                          });
                        }
                      }
                    },
                  ),
                  SizedBox(height: 16.0),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: predictions.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.pin_drop,
                            color: AppColors.blackShade1,
                          ),
                        ),
                        title: Text(predictions[index].description, style:TextStyle(color: Colors.white)),
                        onTap: () async {
                          String location = predictions[index].description;
                          var result = await this
                              .googlePlace
                              .details
                              .get(predictions[index].placeId);
                          double lat = result.result.geometry.location.lat;
                          double lng = result.result.geometry.location.lng;

                          model.storeLocation(location, lat, lng);
                          model.navigateToWeatherScreen();
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
