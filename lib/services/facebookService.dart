import 'dart:convert';

import 'package:auth/services/googleService.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:http/http.dart' as http;
 

Future<FacebookLoginResult> facebookLogin() async{

  final facebookLogin = FacebookLogin();
  final result = await facebookLogin.logIn(['email']);

  switch (result.status) {
    case FacebookLoginStatus.loggedIn:
      
      final FacebookAccessToken accessToken = result.accessToken;
      final token = accessToken.token;
      
      //request user fb profile
      final graphResponse = await http.get('https://graph.facebook.com/v2.12/me?fields=name,picture.width(800).height(800),first_name,last_name,email&access_token=${token}');
      final profile = jsonDecode(graphResponse.body);
      
      nameUser = profile['name'];
      emailUser = profile['email'];
      photoUrl = profile['picture']['data']['url'];

      return result;

      break;
    case FacebookLoginStatus.cancelledByUser:
      break;
    case FacebookLoginStatus.error:
      print(result.errorMessage);
      break;
  }

  return null;
}