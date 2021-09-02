import 'package:flutter/material.dart';
import 'package:afriscouts/const/custom.dart';
import 'package:afriscouts/services/network.dart';
import 'package:afriscouts/screens/user_auth/login_confirm.dart';
import 'package:afriscouts/const/const.dart';

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
  String rollnameController = 'Athlete';
  String rollnameControllerText;
  String response, status, message, userid, username, email, rolename;
  var data;
  String errorMsg;
  bool con = true;
  String futureUser;
  List<String> user;
  User users = User();
  bool _isObscure = true;

  void _register() async {
    try {
      futureUser = await registerUser(
          usernameController.text,
          passwordController.text,
          emailController.text,
          rollnameControllerText);
      if (futureUser == errorMessage) {
        errorMsg = regErrorMessage;
      } else if (futureUser == '400') {
        errorMsg = userExistsError;
      } else {
        user = users.getData(futureUser);
        status = user[0];
        message = user[1];
        userid = user[2];
        username = user[3];
        email = user[4];
        rolename = user[5];
      }
    } catch (e) {
      con = false;
      errorMsg = e.toString();
    }
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    usernameController.dispose();
    passwordController.dispose();
    emailController.dispose();
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
            height: 30,
          ),
          Container(
            padding:
                EdgeInsets.only(top: 0, bottom: 25.0, right: 25.0, left: 25.0),
            decoration: BoxDecoration(
              color: Colors.white54,
            ),
            child: AfriTextField(
              hideText: false,
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
              icon: IconButton(
                  icon: Icon(
                      _isObscure ? Icons.visibility : Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      _isObscure = !_isObscure;
                    });
                  }),
              // inputType: TextInputType.visiblePassword,
              hideText: _isObscure,
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
              hideText: false,
              inputType: TextInputType.emailAddress,
              myController: emailController,
              borderRadiusValue: widget.borderRadiusValue,
              hintText: widget.hintTextEmail,
              textFieldColor: widget.textFieldColor,
            ),
          ),
          Container(
            margin:
                EdgeInsets.only(top: 0, bottom: 0, right: 25.00, left: 25.0),
            padding: EdgeInsets.only(top: 0, bottom: 5.0, right: 10.0, left: 0),
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: 1.0,
                  style: BorderStyle.solid,
                  color: Colors.blue,
                ),
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
              ),
            ),
            child: DropdownButtonHideUnderline(
              child: ButtonTheme(
                alignedDropdown: true,
                child: DropdownButton<String>(
                  isExpanded: true,
                  dropdownColor: widget.textFieldColor,
                  value: rollnameController,
                  //elevation: 5,
                  style: TextStyle(color: Colors.white),
                  iconEnabledColor: Colors.black,
                  items: <String>[
                    'Athlete',
                    'Journalist',
                    'Scout',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(color: Colors.black),
                      ),
                    );
                  }).toList(),
                  hint: Text(
                    "Select your role",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  onChanged: (String value) {
                    setState(() {
                      rollnameController = value;
                      if (value == 'Athlete') {
                        rollnameControllerText = 'ROLE_ATHLETE';
                      } else if (value == 'Scout') {
                        rollnameControllerText = 'ROLE_SCOUT';
                      } else {
                        rollnameControllerText = 'ROLE_JOURNALISTS';
                      }
                    });
                  },
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints.tightFor(width: 310, height: 50),
                child: AfriElevatedButton(
                  borderRadiusValue: widget.borderRadiusValue,
                  onPressed: () {
                    setState(() {
                      _register();
                      if (con == true) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ConfirmRegistration(
                                    username: username,
                                    userid: userid,
                                    email: email)));
                      } else {
                        final regErrorsnackBar =
                            SnackBar(content: Text(errorMsg));
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
