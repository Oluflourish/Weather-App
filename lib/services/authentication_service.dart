import 'package:weather_app/locator.dart';
import 'package:weather_app/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:weather_app/services/firestore_service.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirestoreService _firestoreService = locator<FirestoreService>();

  User _currentUser;
  User get currentUser => _currentUser;

  Future signInWithEmail({
    @required String email,
    @required String password,
  }) async {
    print("TRYY");

    var authResult = await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    await _populateCurrentUser(authResult.user);

    print(authResult.user != null);
    return authResult.user != null;
  }

  Future signUpWithEmail({
    @required String email,
    @required String password,
    @required String firstName,
    @required String lastName,
  }) async {
    try {
      var authResult = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // create a new user profile on firestore
      _currentUser = User(
        id: authResult.user.uid,
        email: email,
        firstName: firstName,
        lastName: lastName,
      );

      await _firestoreService.createUser(_currentUser);

      return authResult.user != null;
    } catch (e) {
      return e.message;
    }
  }

  Future<bool> isUserLoggedIn() async {
    var user = await _firebaseAuth.currentUser();
    await _populateCurrentUser(user);
    return user != null;
  }

  Future _populateCurrentUser(FirebaseUser user) async {
    if (user != null && user is User) {
      _currentUser = await _firestoreService.getUser(user.uid);
    }
  }

  Future signOut() async {
    await _firebaseAuth.signOut();
  }
}
