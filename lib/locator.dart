import 'package:weather_app/services/api_service.dart';
import 'package:weather_app/services/authentication_service.dart';
import 'package:weather_app/services/firestore_service.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_app/services/navigation_service.dart';
import 'package:weather_app/services/dialog_service.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => FirestoreService());
  locator.registerLazySingleton(() => ApiService());
}
