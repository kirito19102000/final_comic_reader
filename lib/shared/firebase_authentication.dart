import 'package:final_comic_reader/models/custom_user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:async';

class FirebaseAuthentication {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  DatabaseReference ref = FirebaseDatabase.instance.reference();

  late User _user;

  Future<String?> createUser(String name, String email, String password) async {
    try {
      UserCredential credential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      final uid = credential.user!.uid; // auto generated user id

      // add users from firebase auth to custom users collection in realtime database
      CustomUser user = CustomUser(id: uid, name: name);
      ref.child('Users/' + uid).set(user.toJson());

      return credential.user!.uid;
    } on FirebaseAuthException {
      return null;
    }
  }


// CustomUser user = CustomUser(name: 'Vince', id: 'id2');
// user.subscribeToComic('comic5');
//
// DatabaseReference ref = FirebaseDatabase.instance.reference().child("users/" + user.id);
//
//
// await ref.set(user.toJson());

  Future<String?> login(String email, String password) async {
    try {
      UserCredential credential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      return credential.user!.uid;
    } on FirebaseAuthException {
      return null;
    }
  }

  Future<bool> logout() async {
    try {
      _firebaseAuth.signOut();
      return true;
    } on FirebaseAuthException {
      return false;
    }
  }

  Future<String?> loginWithGoogle() async {
    final GoogleSignInAccount? googleSignInAccount =
    await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
    await googleSignInAccount!.authentication;
    final AuthCredential authCredential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );
    final UserCredential authResult =
    await _firebaseAuth.signInWithCredential(authCredential);
    final User? user = authResult.user;
    if (user != null) {
      return '$user';
    }
    return null;
  }
}
