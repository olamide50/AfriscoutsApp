import 'package:flutter/material.dart';
import 'package:flutter_login_template/flutter_login_template.dart';
import 'package:afriscouts/screens/user_auth/login_signin.dart';
import 'package:afriscouts/screens/user_auth/login_signup.dart';
import 'package:afriscouts/screens/user_auth/login_forgot.dart';

// import 'package:afriscouts/services/network.dart';

class SignInScreen extends StatefulWidget {
  static const id = 'signin_screen';

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

enum _State { signIn, signUp, forgot, confirm }

class _SignInScreenState extends State<SignInScreen> {
  Future<bool> _onWillPop() {
    return showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Are you sure?'),
            content: Text('Do you want to exit the App?'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text('No'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: Text('Yes'),
              ),
            ],
          ),
        ) ??
        false;
  }

  LoginTemplateStyle style;
  _State state = _State.signIn;

  @override
  void initState() {
    style = LoginTemplateStyle.defaultTemplate;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var signInPage = LoginPage(
      onPressedSignUp: () {
        setState(() {
          state = _State.signUp;
        });
      },
    );

    var signUpPage = SignUpPage(
      onPressedSignIn: () {
        setState(() {
          state = _State.signIn;
        });
      },
    );

    var forgotPasswordPage = ForgotPasswordPage();

    Widget userUnboarding;
    switch (state) {
      case _State.signUp:
        userUnboarding = signUpPage;
        break;
      case _State.forgot:
        userUnboarding = forgotPasswordPage;
        break;

      case _State.signIn:
      default:
        userUnboarding = signInPage;
        break;
    }

    return WillPopScope(
      onWillPop: _onWillPop,
      child: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/images/icon.jpg'))),
          child: Scaffold(
              backgroundColor: Colors.transparent,
              body: SingleChildScrollView(
                child: userUnboarding,
              )),
        ),
      ),
    );
  }
}
