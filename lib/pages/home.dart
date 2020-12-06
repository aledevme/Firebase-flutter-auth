
import 'package:auth/services/googleService.dart';
import 'package:flutter/material.dart';
class HomeScreen extends StatelessWidget {
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FadeInImage(
              width: 300,
              height: 300,
              fit: BoxFit.cover,  
              placeholder: AssetImage('assets/loader.gif'), image: NetworkImage(photoUrl)),
              Text(nameUser,
                style: TextStyle(
                  fontSize: 20
                ),
              ),
              Text(emailUser,
                style: TextStyle(
                  fontSize: 20
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}