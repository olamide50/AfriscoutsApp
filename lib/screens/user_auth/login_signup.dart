import 'package:flutter/material.dart';
import 'package:afriscouts/const/custom.dart';

class SignUpPage extends StatefulWidget {
  final Function() onPressedSignIn;

  /// The action of SignUp button to navigate to [LoginTemplateSignUpPage]
  final Function() onPressedSignUp;

  /// The text of SignIn button.
  final String buttonTextSignIn;

  /// The text of SignUp button.
  final String buttonTextSignUp;

  final String signupText;

  /// Use for the TextField lets the users input their password. See also [LoginTemplateTextField]
  final String hintTextUsername;

  /// Use for the TextField lets the users input their email or phone number. See also [LoginTemplateTextField]
  final String hintTextPassword;

  /// Use for the TextField lets the users input their password. See also [LoginTemplateTextField]
  final String hintTextEmail;

  /// Use for the TextField lets the users input their email or phone number. See also [LoginTemplateTextField]
  final String hintTextRoleName;

  final Color signupColor;

  final Color textFieldColor;

  final double borderRadiusValue;

  const SignUpPage({
    @required this.onPressedSignIn,
    @required this.onPressedSignUp,
    this.buttonTextSignIn = 'Sign In',
    this.buttonTextSignUp = 'Sign Up',
    this.hintTextUsername = 'User name',
    this.hintTextPassword = 'Password',
    this.hintTextEmail = 'Email',
    this.hintTextRoleName = 'Athlete / Scout',
    this.signupText = 'Submit',
    this.signupColor = const Color(0xFF2E2C2C),
    this.textFieldColor = const Color(0xFFFFFFFE),
    this.borderRadiusValue = 25.0,
  });

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.only(top: 50, right: 0, left: 5, bottom: 30),
        child: Column(children: <Widget>[
          SizedBox(height: 30),
          Row(children: [
            Container(
              child: TextButton(
                  onPressed: () {},
                  child: Text(widget.buttonTextSignUp,
                      style: TextStyle(
                          color: widget.signupColor,
                          fontSize: 28,
                          fontWeight: FontWeight.w700))),
              decoration: BoxDecoration(
                  border: Border(
                bottom: BorderSide(width: 2.5, color: widget.signupColor),
              )),
            ),
            SizedBox(width: 20),
            TextButton(
                onPressed: widget.onPressedSignIn,
                child: Text(widget.buttonTextSignIn,
                    style: TextStyle(color: Colors.black38, fontSize: 28))),
          ], mainAxisAlignment: MainAxisAlignment.start),
          SizedBox(
            height: 10,
          ),
          Container(
            padding:
                EdgeInsets.only(top: 0, bottom: 25.0, right: 25.0, left: 25.0),
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
            padding:
                EdgeInsets.only(top: 0, bottom: 25.0, right: 25.0, left: 25.0),
            decoration: BoxDecoration(
              color: Colors.white54,
            ),
            child: AfriTextField(
              borderRadiusValue: widget.borderRadiusValue,
              hintText: widget.hintTextEmail,
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
              hintText: widget.hintTextRoleName,
              textFieldColor: widget.textFieldColor,
            ),
          ),
          Container(
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints.tightFor(width: 310, height: 50),
                child: AfriElevatedButton(
                  borderRadiusValue: widget.borderRadiusValue,
                  onPressed: widget.onPressedSignUp,
                  loginText: widget.signupText,
                  textColor: widget.signupColor,
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
