import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

String nameUser;
String emailUser;
String photoUrl;

Future<String> signInGoogle() async {
  await Firebase.initializeApp();

  try {
    final GoogleSignInAccount signInAccount = await googleSignIn.signIn().catchError((onError) => print(onError));;
  
    if (signInAccount == null) return null;
    
    final GoogleSignInAuthentication googleAuthentication = await signInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuthentication.accessToken,
      idToken: googleAuthentication.idToken
    );

    final UserCredential authResult = await _auth.signInWithCredential(credential);

    final User user = authResult.user;

    if( user != null ){
      nameUser = user.displayName;
      emailUser = user.email;
      photoUrl = user.photoURL;
    
      if(nameUser.contains(" ")){
        nameUser = nameUser.substring(0, nameUser.indexOf(" "));
      }

      final User currentUser = _auth.currentUser;

      return '$user';
    }
  } on PlatformException catch (err) {
    if (err.code == 'sign_in_canceled') { // Checks for sign_in_canceled exception
        print(err.toString());
    } else {
        throw err; // Throws PlatformException again because it wasn't the one we wanted
    }
  }

  return null;
}