import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

String nameUser;
String emailUser;
String photoUrl;

Future<String> signInGoogle() async {
  await Firebase.initializeApp();

  final GoogleSignInAccount signInAccount = await googleSignIn.signIn();
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

  return null;
}