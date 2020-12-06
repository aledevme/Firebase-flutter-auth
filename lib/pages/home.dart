
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
                image: NetworkImage(photoUrl != null ? photoUrl : 'https://slcp.lk/wp-content/uploads/2020/02/no-profile-photo.png' ),
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