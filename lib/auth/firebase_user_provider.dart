import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class RunItFirebaseUser {
  RunItFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

RunItFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<RunItFirebaseUser> runItFirebaseUserStream() => FirebaseAuth.instance
    .authStateChanges()
    .debounce((user) => user == null && !loggedIn
        ? TimerStream(true, const Duration(seconds: 1))
        : Stream.value(user))
    .map<RunItFirebaseUser>((user) => currentUser = RunItFirebaseUser(user));
