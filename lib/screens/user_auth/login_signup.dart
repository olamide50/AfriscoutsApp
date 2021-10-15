import 'package:flutter/material.dart';
import 'package:afriscouts/const/custom.dart';
import 'package:afriscouts/services/network.dart';
import 'package:afriscouts/screens/user_auth/login_confirm.dart';

class SignUpPage extends StatefulWidget {
  static const id = 'signupPage';

  final Function onPressedSignIn;

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
    this.onPressedSignIn,
    this.buttonTextSignIn = 'Sign In',
    this.buttonTextSignUp = 'Sign Up',
    this.hintTextUsername = 'Username',
    this.hintTextPassword = 'Password',
    this.hintTextEmail = 'Email',
    this.hintTextRoleName = 'Role',
    this.signupText = 'Submit',
    this.signupColor = const Color(0xFF2E2C2C),
    this.textFieldColor = const Color(0xFFFFFFFE),
    this.borderRadiusValue = 25.0,
  });

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String rolename = 'Select Role (Athlete)';
  String response,
      status,
      message,
      userid,
      username,
      email,
      password,
      rolenameText;
  var data;
  String errorMsg;
  bool con = true;
  String futureUser;
  List<String> user;
  List result;
  User users = User();
  Msg msg = Msg();
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.only(top: 50, right: 0, left: 5, bottom: 30),
        child: Column(children: <Widget>[
          SizedBox(height: 85),
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
            padding:
                EdgeInsets.only(top: 0, bottom: 25.0, right: 25.0, left: 25.0),
            decoration: BoxDecoration(
              color: Colors.white54,
            ),
            child: TextField(
              onChanged: (value) {
                email = value;
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
                hintText: widget.hintTextEmail,
                fillColor: widget.textFieldColor,
              ),
            ),
          ),
          Container(
            margin:
                EdgeInsets.only(top: 0, bottom: 0, right: 25.00, left: 25.0),
            padding: EdgeInsets.only(top: 0, bottom: 5.0, right: 10.0, left: 0),
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: 1.0,
                  style: BorderStyle.solid,
                  color: Colors.grey[800],
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
                  value: rolename,
                  //elevation: 5,
                  style: TextStyle(color: Colors.white),
                  iconEnabledColor: Colors.black,
                  items: <String>[
                    'Select Role (Athlete)',
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
                      rolename = value;
                      if (value == 'Journalist') {
                        rolenameText = 'ROLE_JOURNALISTS';
                      } else if (value == 'Scout') {
                        rolenameText = 'ROLE_SCOUT';
                      } else {
                        rolenameText = 'ROLE_ATHLETE';
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
                  onPressed: () async {
                    try {
                      final newUser = await registerUser(
                          username, password, email, rolenameText);
                      print(newUser);
                      result = msg.getData(newUser);
                      status = result[0].toString();
                      errorMsg = result[1].toString();
                      if (status == '200') {
                        result = users.getData(newUser);
                        userid = result[2];
                        username = result[3];
                        email = result[4];
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ConfirmRegistration(
                                      username: username,
                                      email: email,
                                      userid: userid,
                                      password: password,
                                    )));
                      } else {
                        final regErrorsnackBar =
                            SnackBar(content: Text(errorMsg));
                        ScaffoldMessenger.of(context)
                            .showSnackBar(regErrorsnackBar);
                      }
                    } catch (e) {
                      print(e.toString());
                      errorMsg = 'User Registration Error!';
                      final regErrorsnackBar =
                          SnackBar(content: Text(errorMsg));
                      ScaffoldMessenger.of(context)
                          .showSnackBar(regErrorsnackBar);
                    }
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
