import 'package:flutter/material.dart';
import 'package:afriscouts/screens/home_screen.dart';
import 'package:afriscouts/screens/bookmarks_screen.dart';
import 'package:afriscouts/screens/profile_screen.dart';
import 'package:afriscouts/screens/registration_screen.dart';
import 'package:afriscouts/screens/search_screen.dart';
import 'package:afriscouts/screens/signin_screen.dart';
import 'package:afriscouts/screens/splash_screen.dart';
import 'package:afriscouts/screens/settings_screen.dart';

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
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
          // This makes the visual density adapt to the platform that you run
          // the app on. For desktop platforms, the controls will be smaller and
          // closer together (more dense) than on mobile platforms.
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: HomeScreen.id,
        routes: {
          HomeScreen.id: (context) => HomeScreen(),
          BookmarksScreen.id: (context) => BookmarksScreen(),
          ProfileScreen.id: (context) => ProfileScreen(),
          SignInScreen.id: (context) => SignInScreen(),
          SearchScreen.id: (context) => SearchScreen(),
          SettingsScreen.id: (context) => SettingsScreen(),
          SplashScreen.id: (context) => SplashScreen(),
          RegistrationScreen.id: (context) => RegistrationScreen(),
        });
  }}
