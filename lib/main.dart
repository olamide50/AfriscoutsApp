import 'package:flutter/material.dart';
import 'package:afriscouts/screens/home_screen.dart';
import 'package:afriscouts/screens/bookmarks_screen.dart';
import 'package:afriscouts/screens/profile_screen.dart';
import 'package:afriscouts/screens/registration_screen.dart';
import 'package:afriscouts/screens/search_screen.dart';
import 'package:afriscouts/screens/signin_screen.dart';
import 'package:afriscouts/screens/splash_screen.dart';
import 'package:afriscouts/screens/settings_screen.dart';
import 'package:afriscouts/screens/welcome_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Afriscouts',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: WelcomeScreen.id,
        routes: {
          HomeScreen.id: (context) => HomeScreen(),
          WelcomeScreen.id: (context) => WelcomeScreen(),
          BookmarksScreen.id: (context) => BookmarksScreen(),
          ProfileScreen.id: (context) => ProfileScreen(),
          SignInScreen.id: (context) => SignInScreen(),
          SearchScreen.id: (context) => SearchScreen(),
          SettingsScreen.id: (context) => SettingsScreen(),
          SplashScreen.id: (context) => SplashScreen(),
          RegistrationScreen.id: (context) => RegistrationScreen(),
        });
  }
}
