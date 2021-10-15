import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:afriscouts/screens/bookmarks_screen.dart';
import 'package:afriscouts/screens/settings_screen.dart';
import 'package:user_profile_avatar/user_profile_avatar.dart';
import 'package:afriscouts/screens/signin_screen.dart';

final signinColor = const Color(0xFF2E2C2C);
final textFieldColor = const Color(0xFFFFFFFE);
final borderRadiusValue = 25.0;
final loginText = 'Submit';

class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              height: 300.0,
              child: DrawerHeader(
                padding: EdgeInsets.zero,
                child: Padding(
                    padding: EdgeInsets.fromLTRB(10.0, 20.0, 0.0, 0.0),
                    child: Column(
                      children: [
                        UserProfileAvatar(
                          avatarUrl:
                              'http://richardandbell.com/images/user-avatar-big-01.jpg',
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
                        TextButton(
                          child: Text('Logout'),
                          onPressed: () {
                            Navigator.popAndPushNamed(context, SignInScreen.id);
                          },
                        )
                      ],
                    )),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
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
      ),
    );
  }
}

class AppBarText extends StatelessWidget {
  AppBarText({@required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontWeight: FontWeight.w400,
        fontFamily: 'Calibri',
      ),
    );
  }
}

class AfriTextField extends StatefulWidget {
  final double borderRadiusValue;
  final String hintText;
  final Color textFieldColor;
  final myController;
  final inputType;
  final bool hideText;
  final IconButton icon;

  const AfriTextField({
    @required this.borderRadiusValue,
    @required this.hintText,
    @required this.textFieldColor,
    @required this.myController,
    this.inputType,
    this.hideText,
    this.icon,
  });

  _AfriTextFieldState createState() => _AfriTextFieldState();
}

class _AfriTextFieldState extends State<AfriTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: false,
      obscureText: widget.hideText,
      keyboardType: widget.inputType,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadiusValue),
          ),
          filled: true,
          hintStyle: TextStyle(color: Colors.grey[800]),
          hintText: widget.hintText,
          fillColor: widget.textFieldColor,
          suffixIcon: widget.icon),
      controller: widget.myController,
    );
  }
}

class AfriElevatedButton extends StatefulWidget {
  final double borderRadiusValue;
  final Function onPressed;
  final String loginText;
  final Color textColor;

  const AfriElevatedButton({
    @required this.borderRadiusValue,
    @required this.onPressed,
    @required this.loginText,
    @required this.textColor,
  });

  @override
  _AfriElevatedButtonState createState() => _AfriElevatedButtonState();
}

class _AfriElevatedButtonState extends State<AfriElevatedButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed,
      child: Text(widget.loginText),
      style: ButtonStyle(
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius:
                BorderRadius.all(Radius.circular(widget.borderRadiusValue)),
          )),
          backgroundColor: MaterialStateProperty.all(Colors.orange[600]),
          padding: MaterialStateProperty.all(EdgeInsets.all(10)),
          textStyle: MaterialStateProperty.all(
              TextStyle(fontSize: 20, color: widget.textColor))),
      
    );
  }
}

const spinkit = SpinKitThreeBounce(
  color: Colors.blue,
  size: 50.0,
);

// final regErrorsnackBar = SnackBar(content: Text(regErrorMessage));

class CustomFlatButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final FaIcon icon;
  final Function onTap;

  CustomFlatButton(
      {@required this.text,
      this.backgroundColor,
      @required this.icon,
      this.onTap});
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        onTap();
      },
      child: Container(
        color: backgroundColor,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.blueAccent),
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
        padding: EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            icon,
            Padding(
                padding: EdgeInsets.only(left: 6.0),
                child: Text(text, style: TextStyle(fontSize: 20.0))),
          ],
        ),
      ),
    );
  }
}

class TopPanel extends StatelessWidget {
  final String id;
  final String category;
  final Color backgroundColor;
  final FaIcon icon;
  final Function onTap;

  TopPanel(
      {@required this.category,
      this.id,
      this.backgroundColor,
      @required this.icon,
      this.onTap});
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        onTap();
      },
      child: Container(
        color: backgroundColor,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              //                    <--- bottom side
              color: Colors.black,
              width: 2.0,
            ),
          ),
        ),
        padding: EdgeInsets.all(0.0),
        margin: EdgeInsets.all(0.0),
        child: Row(
          children: <Widget>[
            Expanded(child: Text(id, style: TextStyle(fontSize: 14.0))),
            Expanded(child: Text(category, style: TextStyle(fontSize: 14.0))),
            icon,
          ],
        ),
      ),
    );
  }
}

class CustomListTile extends StatefulWidget {
  CustomListTile(
      {this.image,
      @required this.title,
      this.details,
      @required this.time,
      @required this.newsSource,
      @required this.name,
      @required this.newsUrl,
      @required this.newsContent,
      @required this.onPressed,
      @required this.onLongPressed});

  final String image;
  final String title;
  final String details;
  final String newsSource;
  final String time;
  final String name;
  final String newsContent;
  final String newsUrl;
  final Function onPressed;
  final Function onLongPressed;
  @override
  _CustomListTileState createState() => _CustomListTileState();
}

class _CustomListTileState extends State<CustomListTile> {
  static Color colorDefault = Colors.black38;
  Color color = colorDefault;
  @override
  Widget build(BuildContext context) {
    String altImage = 'http://richardandbell.com/images/user-avatar-big-01.jpg';
    Image img;
    if (widget.image == 'No info') {
      img = Image.network(altImage, height: 55.0, width: 55.0);
    } else {
      img = Image.network(widget.image, height: 55.0, width: 55.0);
    }
    String time =
        new DateFormat('MMM d, h:mm a').format(DateTime.parse(widget.time));

    return ListTile(
      contentPadding: EdgeInsets.all(15.0),
      leading: img,
      title: Text(widget.time),
      subtitle: Text('$time'),
      trailing: IconButton(
          icon: FaIcon(FontAwesomeIcons.star, color: color), onPressed: () {}),
      onTap: () {
        widget.onPressed();
      },
      onLongPress: () {
        widget.onLongPressed();
      },
    );
  }
}

class CustomListView extends StatelessWidget {
  final List<String> source;
  final List<String> title;
  final List<String> content;
  final List<String> description;
  final List<String> imageString;
  final List<String> author;
  final List<String> time;
  final List<String> url;
  final String empty = 'No info';
  final Function onTap;
  final int selector;
  final List<int> id;
  final ScrollController myController;

  CustomListView({
    @required this.source,
    @required this.title,
    @required this.content,
    @required this.description,
    @required this.imageString,
    @required this.author,
    @required this.time,
    @required this.url,
    @required this.onTap,
    @required this.selector,
    this.myController,
    this.id,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      controller: myController,
      itemCount: title.length,
      separatorBuilder: (BuildContext context, int index) =>
          Divider(height: 20.0, color: Colors.grey),
      itemBuilder: (BuildContext context, int index) {
        return CustomListTile(
            image: imageString[index],
            title: title[index],
            details: description[index],
            newsSource: source[index],
            time: time[index],
            name: author[index],
            newsContent: content[index],
            newsUrl: url[index],
            onPressed: () {
              onTap(index);
            },
            onLongPressed: () {});
      },
    );
  }
}
