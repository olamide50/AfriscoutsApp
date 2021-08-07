import 'package:flutter/material.dart';
import 'package:afriscouts/const/custom.dart';
import 'package:afriscouts/services/network.dart';
import 'package:afriscouts/screens/user_auth/login_confirm.dart';
import 'dart:convert';

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
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final rollnameController = TextEditingController();
  int response;
  var data;

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    usernameController.dispose();
    passwordController.dispose();
    emailController.dispose();
    rollnameController.dispose();
    super.dispose();
  }

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
              myController: usernameController,
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
              myController: passwordController,
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
              myController: emailController,
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
              myController: rollnameController,
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
                  onPressed: () {
                    setState(() async {
                      data = await registerUser(
                          usernameController.text,
                          passwordController.text,
                          emailController.text,
                          rollnameController.text);
                      response = int.parse(User().getData(data));

                      if (response == 200 || response == 500) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ConfirmRegistration()));
                      } else {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(regErrorsnackBar);
                      }
                    });
                  },
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
