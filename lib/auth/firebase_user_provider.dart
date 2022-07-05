import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class HotelsAppFirebaseUser {
  HotelsAppFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

HotelsAppFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<HotelsAppFirebaseUser> hotelsAppFirebaseUserStream() => FirebaseAuth
    .instance
    .authStateChanges()
    .debounce((user) => user == null && !loggedIn
        ? TimerStream(true, const Duration(seconds: 1))
        : Stream.value(user))
    .map<HotelsAppFirebaseUser>(
        (user) => currentUser = HotelsAppFirebaseUser(user));
