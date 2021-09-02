import 'package:flutter/material.dart';
import 'package:preferences/preferences.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:afriscouts/const/custom.dart';

class SettingsScreen extends StatefulWidget {
  static const id = 'settings_screen';
  static String headerText = 'Settings';

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  void changeBrightness() {
    DynamicTheme.of(context).setBrightness(
        Theme.of(context).brightness == Brightness.dark
            ? Brightness.light
            : Brightness.dark);
  }

  void changeColor() {
    DynamicTheme.of(context).setThemeData(ThemeData(
        primaryColor: Theme.of(context).primaryColor == Colors.indigo
            ? Colors.red
            : Colors.indigo));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: (AppBarText(title: SettingsScreen.headerText)),
      ),
      body: PreferencePage([
        PreferenceTitle('Personalization'),
        RadioPreference(
          'Light Theme',
          'light',
          'ui_theme',
          isDefault: true,
          onSelect: () {
            DynamicTheme.of(context).setBrightness(Brightness.light);
          },
        ),
        RadioPreference(
          'Dark Theme',
          'dark',
          'ui_theme',
          onSelect: () {
            DynamicTheme.of(context).setBrightness(Brightness.dark);
          },
        ),
        PreferenceTitle('About'),
        PreferenceText(
          PrefService.getString('dev') ?? '',
          style: TextStyle(color: Colors.grey),
        ),
        PreferenceText(
          PrefService.getString('email') ?? '',
          style: TextStyle(color: Colors.grey),
        ),
        PreferenceText(
          PrefService.getString('phone') ?? '',
          style: TextStyle(color: Colors.grey),
        ),
      ]),
    );
  }
}
