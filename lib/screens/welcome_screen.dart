import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:afriscouts/screens/signin_screen.dart';

class WelcomeScreen extends StatefulWidget {
  static const id = 'loading_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      seconds: 5,
      navigateAfterSeconds: new SignInScreen(),
      title: new Text(
        '',
        style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
      ),
      imageBackground: AssetImage('assets/images/splash_image.png'),
      backgroundColor: Colors.white,
      loaderColor: Colors.red,
    );
  }
}
