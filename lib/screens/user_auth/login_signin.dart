import 'package:flutter/material.dart';
import 'package:afriscouts/const/custom.dart';
import 'package:afriscouts/services/network.dart';
import 'package:afriscouts/screens/home_screen.dart';
import 'package:afriscouts/const/const.dart';

class LoginPage extends StatefulWidget {
  //Arguments
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
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  var data;
  String token;
  bool spin = false;
  bool _isObscure = true;
  String futureUser,
      errorMsg,
      userid,
      username,
      password,
      email,
      status,
      roleName,
      updateAt,
      updatedBy;
  List user;
  UserAuth users = UserAuth();

  @override
  void initState() {
    super.initState();
    // createToken(passwordController.text, usernameController.text);
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _signIn(String username, String password) async {
    try {
      futureUser = await authenticateUser(username, password);
      print(futureUser);
      if (futureUser == errorMessage) {
        errorMsg = 'Sign In Error';
        final regErrorsnackBar = SnackBar(content: Text(errorMsg));
        ScaffoldMessenger.of(context).showSnackBar(regErrorsnackBar);
      } else {
        user = users.getData(futureUser);
        userid = user[0];
        username = user[1];
        email = user[2];
        status = user[3];
        email = user[4];
        roleName = user[5];
        updateAt = user[6];
        updatedBy = user[7];
        spin = false;
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => HomeScreen(
                    username: username,
                    email: email,
                    userid: userid,
                    status: status)));
      }
    } catch (e) {
      //con = false;
      errorMsg = 'Sign In Error!';
      spin = false;
    }
  }

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
            child: TextField(
              onChanged: (value) {
                username = value;
              },
              autofocus: false,
              obscureText: false,
              // keyboardType: widget.inputType,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.borderRadiusValue),
                ),
                filled: true,
                hintStyle: TextStyle(color: Colors.grey[800]),
                hintText: widget.hintTextUsername,
                fillColor: widget.textFieldColor,
              ),
            ),
          ),
          Container(
            padding:
                EdgeInsets.only(top: 0, bottom: 25.0, right: 25.0, left: 25.0),
            decoration: BoxDecoration(
              color: Colors.white54,
            ),
            child: TextField(
              onChanged: (value) {
                password = value;
              },
              autofocus: false,
              obscureText: _isObscure,
              // keyboardType: widget.inputType,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.borderRadiusValue),
                ),
                filled: true,
                hintStyle: TextStyle(color: Colors.grey[800]),
                hintText: widget.hintTextPassword,
                fillColor: widget.textFieldColor,
                suffixIcon: IconButton(
                    icon: Icon(
                        _isObscure ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    }),
              ),
            ),
          ),
          Container(
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints.tightFor(width: 310, height: 50),
                child: AfriElevatedButton(
                  borderRadiusValue: widget.borderRadiusValue,
                  onPressed: () async {
                    try {
                      spin = true;
                      final newUser =
                          await authenticateUser(username, password);
                      print(newUser);
                      user = users.getData(newUser);
                      userid = user[0].toString();
                      username = user[1].toString();
                      email = user[2].toString();
                      status = user[3].toString();
                      roleName = user[4].toString();
                      updateAt = user[5].toString();
                      updatedBy = user[6].toString();

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeScreen(
                                  username: username,
                                  email: email,
                                  userid: userid,
                                  status: status)));

                      /* setState(() {
                        spin = false;
                      }); */
                    } catch (e) {
                      print(e);
                    }
                  },
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
          ),
          Container(
            color: Colors.white,
            child: (spin) ? spinkit : null,
          )
        ]),
      ),
    );
  }
}
