//import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:afriscouts/const/custom.dart';
import 'package:afriscouts/screens/bookmarks_screen.dart';
import 'package:afriscouts/screens/settings_screen.dart';
import 'package:user_profile_avatar/user_profile_avatar.dart';


const String errorMessage = 'ERROR';
const String regErrorMessage = 'Error Creating User!';
const String userExistsError = 'User Already Exists!';

const String retry = 'RETRY';
const String loading = 'LOADING';
const int pageSize = 20;

Widget drawerWidget(BuildContext context) {
  return Drawer(
    child: ListView(
      // Important: Remove any padding from the ListView.
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          padding: EdgeInsets.zero,
          child: Padding(
              padding: EdgeInsets.fromLTRB(10.0, 20.0, 0.0, 0.0),
              child: Column(
                children: [
                  UserProfileAvatar(
                    avatarUrl: 'http://richardandbell.com/images/user-avatar-big-01.jpg',
                    onAvatarTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Tapped on avatar'),
                        ),
                      );
                    },
                    notificationBubbleTextStyle: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    avatarSplashColor: Colors.purple,
                    radius: 60,
                    isActivityIndicatorSmall: false,
                    avatarBorderData: AvatarBorderData(
                      borderColor: Colors.redAccent,
                      borderWidth: 5.0,
                    ),
                  ),
                  /* SizedBox(height: 2.0),
                  Text('Display picture', style: TextStyle(fontSize: 12.0)) */
                ],
              )),
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
        ),
        SizedBox(height: 20.0),
        CustomFlatButton(
          text: 'Bookmarks',
          onTap: () {
            Navigator.popAndPushNamed(context, BookmarksScreen.id);
          },
          icon: FaIcon(
            FontAwesomeIcons.star,
            color: Colors.yellow,
          ),
        ),
        SizedBox(height: 20.0),
        CustomFlatButton(
          text: 'Settings',
          onTap: () {
            Navigator.popAndPushNamed(context, SettingsScreen.id);
          },
          icon: FaIcon(
            FontAwesomeIcons.cog,
            color: Colors.black,
          ),
        ),
      ],
    ),
  );
}
