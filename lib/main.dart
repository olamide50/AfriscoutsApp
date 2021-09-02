import 'package:flutter/material.dart';
import 'package:afriscouts/screens/bookmarks_screen.dart';
import 'package:afriscouts/screens/profile_screen.dart';
import 'package:afriscouts/screens/registration_screen.dart';
import 'package:afriscouts/screens/search_screen.dart';
import 'package:afriscouts/screens/signin_screen.dart';
import 'package:afriscouts/screens/splash_screen.dart';
import 'package:afriscouts/screens/settings_screen.dart';
import 'package:afriscouts/screens/welcome_screen.dart';
import 'package:preferences/preferences.dart';
import 'package:dynamic_theme/dynamic_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await PrefService.init(prefix: 'pref_');

  PrefService.setDefaultValues({
    'dev': 'Afriscouts 2021 \u00a9',
    'email': 'Email: us@email.com',
    'phone': 'Phone: +234-0101010101',
  });
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return DynamicTheme(
        defaultBrightness: Brightness.light,
        data: (brightness) => new ThemeData(
              primarySwatch: Colors.indigo,
              brightness: brightness,
            ),
        themedWidgetBuilder: (context, theme) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Afriscouts',
              theme: theme,
              initialRoute: WelcomeScreen.id,
              routes: {
                WelcomeScreen.id: (context) => WelcomeScreen(),
                BookmarksScreen.id: (context) => BookmarksScreen(),
                ProfileScreen.id: (context) => ProfileScreen(),
                SignInScreen.id: (context) => SignInScreen(),
                SearchScreen.id: (context) => SearchScreen(),
                SettingsScreen.id: (context) => SettingsScreen(),
                SplashScreen.id: (context) => SplashScreen(),
                RegistrationScreen.id: (context) => RegistrationScreen(),
              });
        });
  }
}
