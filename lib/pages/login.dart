import 'package:flutter/material.dart';
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  List<dynamic> socialMedias = [
    'assets/google.png',
    'assets/facebook.png',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal:30,
          vertical:50
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.10),
            Text('Inicia sesión!',
              style: TextStyle(
                fontSize: 40
              ),
            ),
            Text('Escoje una opción para loguearte',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w100
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              child: Wrap(
                spacing: 20,
                children: socialMedias.asMap().map((int index, dynamic e){ 
                return MapEntry(index, 
                    //Text('${socialMedias[index]}')
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.grey[400]
                        )
                      ),
                      child: Image(
                        height: 60,
                        width: 60,
                        image: AssetImage(socialMedias[index]),
                      ),
                    )
                  );
                }).values.toList(),
              ),
            )
          ],
        ),
      ),
    );
  }

  
}