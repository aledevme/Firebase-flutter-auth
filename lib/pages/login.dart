import 'package:auth/services/googleService.dart';
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
  bool isLoadingFacebookResponse = false;
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
            Text('Escoge una opción para loguearte',
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
                children: [
                Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.grey[400]
                      )
                    ),
                    child: GestureDetector(
                        onTap: (){
                          try {
                            signInGoogle().then((result) => {
                              if( result != null ){
                                Navigator.pushNamed(context, 'home')
                              }
                            });
                          } catch (e) {
                            print('entro aqui');
                          } 
                        },
                        child: Image(
                        height: 60,
                        width: 60,
                        image: AssetImage('assets/google.png'),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.grey[400]
                      )
                    ),
                    child: GestureDetector(
                        onTap: (){
                          try {
                            facebookLogin().then((result){
                              if(result != null){
                                Navigator.pushNamed(context, 'home');
                              }

                            });
                          } catch (e) {
                            print('entro aqui');
                          } 
                        },
                        child: Image(
                        height: 60,
                        width: 60,
                        fit: BoxFit.cover,
                        image: AssetImage('assets/facebook.png'),
                      ),
                    ),
                  )
                ]
              ),
            )
          ],
        ),
      ),
    );
  }

  _showMaterialDialog(BuildContext context) {
    showDialog(
    context: context,
    builder: (_) => new AlertDialog(
      title: Text('Loading Facebook Response'),
      content: Image(
        image: AssetImage('assets/loader.gif'),
      )
    ));
  }

  
}