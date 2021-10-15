//import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:afriscouts/const/custom.dart';
import 'package:afriscouts/screens/bookmarks_screen.dart';
import 'package:afriscouts/screens/settings_screen.dart';
import 'package:user_profile_avatar/user_profile_avatar.dart';
import 'package:afriscouts/screens/signin_screen.dart';
import 'package:afriscouts/screens/profile_screen.dart';

const String errorMessage = 'ERROR';
const String regErrorMessage = 'Error Creating User!';
const String userExistsError = 'User Already Exists!';

const String retry = 'RETRY';
const String loading = 'LOADING';
const int pageSize = 20;

class AppDrawer extends StatefulWidget {
  final username, password, email, userid, status, roleName, token;
  final String imageURL;

  AppDrawer(
      {@required this.email,
      @required this.username,
      @required this.imageURL,
      @required this.password,
      @required this.status,
      @required this.roleName,
      @required this.token,
      @required this.userid});

  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(widget.imageURL),
            ),
            accountEmail: Text(
              widget.email,
              style: TextStyle(color: Colors.black),
            ),
            accountName: Text(
              widget.username,
              style: TextStyle(fontSize: 24.0, color: Colors.black),
            ),
            decoration: BoxDecoration(
              color: Colors.white60,
            ),
          ),
          DrawerListTile(
              icon: FaIcon(FontAwesomeIcons.user, color: Colors.black54),
              text: 'Profile',
              size: 20.0,
              onTap: () {
                //Navigator.popAndPushNamed(context, ProfileScreen.id);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProfileScreen(
                            username: widget.username,
                            email: widget.email,
                            userid: widget.userid,
                            status: widget.status,
                            roleName: widget.roleName,
                            token: widget.token,
                            imageURL: widget.imageURL,
                            password: widget.password)));
              }),
          DrawerListTile(
              icon: FaIcon(FontAwesomeIcons.bookmark, color: Colors.black54),
              text: 'Bookmarks',
              size: 20.0,
              onTap: () {
                Navigator.popAndPushNamed(context, BookmarksScreen.id);
              }),
          SizedBox(height: 25.0),
          const Divider(
            height: 10,
            thickness: 1,
          ),
          DrawerListTile(
              icon: FaIcon(FontAwesomeIcons.cog, color: Colors.black54),
              text: 'Settings',
              size: 20.0,
              onTap: () {
                Navigator.popAndPushNamed(context, SettingsScreen.id);
              }),
          DrawerListTile(
              icon: FaIcon(FontAwesomeIcons.questionCircle,
                  color: Colors.black54),
              text: 'Help',
              size: 20.0,
              onTap: () {}),
          SizedBox(height: 40),
          DrawerListTile(
              icon: FaIcon(FontAwesomeIcons.signOutAlt, color: Colors.black54),
              text: 'Logout',
              size: 20.0,
              onTap: () {
                Navigator.popAndPushNamed(context, SignInScreen.id);
              }),
          SizedBox(height: 40),
          Center(
              child: Image(
                  image: AssetImage('assets/images/icon.jpg'), width: 100)),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatefulWidget {
  final FaIcon icon;
  final String text;
  final double size;
  final Function onTap;

  DrawerListTile(
      {@required this.icon,
      @required this.text,
      @required this.size,
      @required this.onTap});

  @override
  _DrawerListTileState createState() => _DrawerListTileState();
}

class _DrawerListTileState extends State<DrawerListTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: widget.icon,
      title: Text(
        widget.text,
        style: TextStyle(fontSize: widget.size),
      ),
      onTap: widget.onTap,
    );
  }
}
