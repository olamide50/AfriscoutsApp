import 'package:flutter/material.dart';
import 'package:afriscouts/const/custom.dart';
import 'package:afriscouts/screens/home_screen.dart';

class ConfirmRegistration extends StatefulWidget {
  final String userid;
  final String username;
  final String email;

  ConfirmRegistration(
      {@required this.userid, @required this.username, @required this.email});
  @override
  _ConfirmRegistrationState createState() => _ConfirmRegistrationState();
}

class _ConfirmRegistrationState extends State<ConfirmRegistration> {
  final otpController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/images/background.png'))),
              padding:
                  EdgeInsets.only(top: 150, right: 20, left: 20, bottom: 10),
              child: Column(
                children: <Widget>[
                  Text(
                      'Enter the 6 digit one Time password (OTP) sent to your email and press the submit button'),
                  SizedBox(height: 20),
                  AfriTextField(
                    hideText: false,
                    myController: otpController,
                    borderRadiusValue: 25.0,
                    hintText: 'Enter OTP',
                    textFieldColor: textFieldColor,
                  ),
                  SizedBox(height: 20),
                  Container(
                    child: Center(
                      child: ConstrainedBox(
                        constraints:
                            BoxConstraints.tightFor(width: 310, height: 50),
                        child: AfriElevatedButton(
                          borderRadiusValue: borderRadiusValue,
                          onPressed: () {
                            setState(() {if (otpController.text == '123456')
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomeScreen()));
                            });
                          },
                          loginText: loginText,
                          textColor: signinColor,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Center(
                      child: ConstrainedBox(
                        constraints:
                            BoxConstraints.tightFor(width: 310, height: 50),
                        child: TextButton(
                          onPressed: () {},
                          child: Text('Resend OTP',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
