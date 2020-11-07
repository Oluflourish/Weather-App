import 'package:flutter/material.dart';
import 'package:weather_app/services/navigation_service.dart';
import 'package:weather_app/services/dialog_service.dart';
import 'package:weather_app/ui/views/startup_view.dart';
import 'managers/dialog_manager.dart';
import 'ui/router.dart';
import 'locator.dart';
import 'package:weather_app/utils/colors.dart';

void main() async {
  // Register all the models and services before the app starts
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  // Initializes the translation module
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      debugShowCheckedModeBanner: false,
      builder: (context, child) => Navigator(
        key: locator<DialogService>().dialogNavigationKey,
        onGenerateRoute: (settings) => MaterialPageRoute(
            builder: (context) => DialogManager(child: child)),
      ),
      navigatorKey: locator<NavigationService>().navigationKey,
      theme: ThemeData(
        primaryColor: AppColors.blackShade1,
        textTheme: Theme.of(context).textTheme.apply(
              fontFamily: 'Open Sans',
              // fontFamily: 'Montserrat',
            ),
      ),
      home: StartUpView(),
      onGenerateRoute: generateRoute,
    );
  }
}
