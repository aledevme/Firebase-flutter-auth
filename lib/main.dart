import 'package:auth/pages/home.dart';
import 'package:auth/pages/login.dart';
import 'package:flutter/material.dart';
void main() async {
  runApp(MyApp());
}
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Authentications',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/' : (BuildContext context) => LoginPage(),
        'home' : (BuildContext context) => HomeScreen()
      },
    );
  }
}