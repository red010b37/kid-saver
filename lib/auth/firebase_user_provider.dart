import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class KidSaverFirebaseUser {
  KidSaverFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

KidSaverFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<KidSaverFirebaseUser> kidSaverFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<KidSaverFirebaseUser>(
            (user) => currentUser = KidSaverFirebaseUser(user));
