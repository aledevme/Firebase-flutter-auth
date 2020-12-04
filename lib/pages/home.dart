
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
              Image(
                image: NetworkImage(photoUrl),
              ),
              Text(nameUser),
              Text(emailUser)
            ],
          ),
        ),
      ),
    );
  }
}