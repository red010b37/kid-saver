import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class KidsSaverFirebaseUser {
  KidsSaverFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

KidsSaverFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<KidsSaverFirebaseUser> kidsSaverFirebaseUserStream() => FirebaseAuth
    .instance
    .authStateChanges()
    .debounce((user) => user == null && !loggedIn
        ? TimerStream(true, const Duration(seconds: 1))
        : Stream.value(user))
    .map<KidsSaverFirebaseUser>(
        (user) => currentUser = KidsSaverFirebaseUser(user));
