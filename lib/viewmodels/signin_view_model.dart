import 'package:weather_app/constants/route_names.dart';
import 'package:weather_app/locator.dart';
import 'package:weather_app/services/authentication_service.dart';
import 'package:weather_app/services/dialog_service.dart';
import 'package:weather_app/services/navigation_service.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'base_model.dart';

class SignInViewModel extends BaseModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();

 Future login({
    @required String email,
    @required String password,
  }) async {
    setBusy(true);

    var result = await _authenticationService.signInWithEmail(
      email: email,
      password: password,
    );

    setBusy(false);

    if (result is bool) {
      if (result) {
        _navigationService.navigateTo(HomeViewRoute);

        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setBool('WA_isLoggenIn', true);

      } else {
        await _dialogService.showDialog(
          title: 'Login Failure',
          description: 'General login failure. Please try again later',
        );
      }
    } else {
      await _dialogService.showDialog(
        title: 'Login Failure',
        description: result,
      );
    }
  }

  Future login2({
    @required String email,
    @required String password,
  }) async {
    setBusy(true);

    _authenticationService
        .signInWithEmail(
      email: email,
      password: password,
    )
        .then((value) async {
      setBusy(false);

      _navigationService.navigateTo(HomeViewRoute);

      SharedPreferences prefs = await SharedPreferences.getInstance();
      // await prefs.setString('WA_userAuthId', _authenticationService.currentUser.id);
      await prefs.setBool('WA_isLoggenIn', true);
    }).catchError((onError) async {
      setBusy(false);

      await _dialogService.showDialog(
        title: 'Login Failure',
        description: 'General login failure. Please try again later',
      );
    });
  }

  void navigateToSignUp() {
    _navigationService.navigateTo(SignUpViewRoute);
  }
}
