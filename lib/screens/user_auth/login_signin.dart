import 'package:flutter/material.dart';
import 'package:afriscouts/const/custom.dart';

class LoginPage extends StatefulWidget {
  static const id = 'login_page';

  /// The action of SignIn button.
  final Function() onPressedSignIn;

  /// The action of ForgotPassword button to navigate to [LoginTemplateForgotPasswordPage]
  final Function() onPressedForgot;

  /// The action of SignUp button to navigate to [LoginTemplateSignUpPage]
  final Function() onPressedSignUp;

  /// The text of SignIn button.
  final String buttonTextSignIn;

  /// The text of ForgotPassword button.
  final String buttonTextForgotPassword;

  /// The text of SignUp button.
  final String buttonTextSignUp;

  final String loginText;

  /// Use for the TextField lets the users input their password. See also [LoginTemplateTextField]
  final String hintTextUsername;

  /// Use for the TextField lets the users input their email or phone number. See also [LoginTemplateTextField]
  final String hintTextPassword;

  final Color signinColor;

  final Color textFieldColor;

  final double borderRadiusValue;

  const LoginPage({
    @required this.onPressedSignIn,
    @required this.onPressedForgot,
    @required this.onPressedSignUp,
    this.buttonTextSignIn = 'Sign In',
    this.buttonTextSignUp = 'Sign Up',
    this.buttonTextForgotPassword = 'Forgot Password',
    this.hintTextUsername = 'User name / Email',
    this.hintTextPassword = 'Password',
    this.loginText = 'Submit',
    this.signinColor = const Color(0xFF2E2C2C),
    this.textFieldColor = const Color(0xFFFFFFFE),
    this.borderRadiusValue = 25.0,
  });

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.only(top: 60, right: 0, left: 0, bottom: 30),
        child: Column(children: <Widget>[
          SizedBox(height: 80),
          Row(children: [
            TextButton(
                onPressed: widget.onPressedSignUp,
                child: Text(widget.buttonTextSignUp,
                    style: TextStyle(color: Colors.black38, fontSize: 28))),
            SizedBox(width: 20),
            Container(
              child: TextButton(
                  onPressed: () {},
                  child: Text(widget.buttonTextSignIn,
                      style: TextStyle(
                          color: widget.signinColor,
                          fontSize: 28,
                          fontWeight: FontWeight.w700))),
              decoration: BoxDecoration(
                  border: Border(
                bottom: BorderSide(width: 2.5, color: widget.signinColor),
              )),
            ),
          ], mainAxisAlignment: MainAxisAlignment.start),
          SizedBox(
            height: 30,
          ),
          Container(
            padding: EdgeInsets.all(25.0),
            decoration: BoxDecoration(
              color: Colors.white54,
            ),
            child: AfriTextField(
              borderRadiusValue: widget.borderRadiusValue,
              hintText: widget.hintTextUsername,
              textFieldColor: widget.textFieldColor,
            ),
          ),
          Container(
            padding:
                EdgeInsets.only(top: 0, bottom: 25.0, right: 25.0, left: 25.0),
            decoration: BoxDecoration(
              color: Colors.white54,
            ),
            child: AfriTextField(
              borderRadiusValue: widget.borderRadiusValue,
              hintText: widget.hintTextPassword,
              textFieldColor: widget.textFieldColor,
            ),
          ),
          Container(
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints.tightFor(width: 310, height: 50),
                child: AfriElevatedButton(
                  borderRadiusValue: widget.borderRadiusValue,
                  onPressed: widget.onPressedSignIn,
                  loginText: widget.loginText,
                  textColor: widget.signinColor,
                ),
              ),
            ),
          ),
          Container(
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints.tightFor(width: 310, height: 50),
                child: TextButton(
                  onPressed: widget.onPressedForgot,
                  child: Text('Forgot Password',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
