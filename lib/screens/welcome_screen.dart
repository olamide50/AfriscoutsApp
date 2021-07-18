import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

class WelcomeScreen extends StatefulWidget {
  static const id = 'loading_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      seconds: 8,
      navigateAfterSeconds: new AfterSplash(),
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

class AfterSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Welcome In SplashScreen Package"),
        automaticallyImplyLeading: false,
      ),
      body: new Center(
        child: new Text(
          "Succeeded!",
          style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
        ),
      ),
    );
  }
}
