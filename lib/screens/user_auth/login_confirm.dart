import 'package:flutter/material.dart';
import 'package:afriscouts/const/custom.dart';
import 'package:afriscouts/const/secret.dart';
import 'package:afriscouts/services/network.dart';
/* import 'package:afriscouts/screens/user_auth/login_complete_reg.dart'; */
import 'package:afriscouts/screens/home_screen.dart';

class ConfirmRegistration extends StatefulWidget {
  final String userid;
  final String username;
  final String email;
  final String password;

  ConfirmRegistration(
      {@required this.userid,
      @required this.username,
      @required this.email,
      @required this.password});
  @override
  _ConfirmRegistrationState createState() => _ConfirmRegistrationState();
}

class _ConfirmRegistrationState extends State<ConfirmRegistration> {
  String otpText, otpTypedText, errorMsg;
  String eToken;
  String _validation;
  String futureUser,
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
  Token userToken = Token();
  OTP otp = OTP();

  void _getOTP() async {
    String url = '$otpURL${widget.userid}';
    print(url);
    try {
      final otpCode = await genOTP(url);

      otpText = otp.getData(otpCode).toString();
      print(otpText);
      OTPDialog dilg = OTPDialog(otpText: otpText);
      showDialog(context: context, builder: (BuildContext context) => dilg);
    } catch (e) {
      errorMsg = 'OTP Error!';
      print(e.toString());
      final regErrorsnackBar = SnackBar(content: Text(errorMsg));
      ScaffoldMessenger.of(context).showSnackBar(regErrorsnackBar);
    }
  }

  @override
  void initState() {
    _getOTP();
    super.initState();
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
                  TextField(
                    onChanged: (value) {
                      otpTypedText = value;
                    },
                    textAlign: TextAlign.center,
                    autofocus: false,
                    obscureText: false,
                    // keyboardType: widget.inputType,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      filled: true,
                      hintStyle: TextStyle(color: Colors.grey[800]),
                      hintText: 'Enter OTP',
                      fillColor: Colors.white70,
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    child: Center(
                      child: ConstrainedBox(
                        constraints:
                            BoxConstraints.tightFor(width: 310, height: 50),
                        child: AfriElevatedButton(
                          borderRadiusValue: borderRadiusValue,
                          onPressed: () async {
                            print(widget.email);
                            print(otpTypedText);
                            print(widget.username);
                            try {
                              CorrectOTP correctOTP = CorrectOTP();
                              final data = await valOTP(
                                  widget.email, otpTypedText, widget.username);
                              _validation = correctOTP.getData(data);
                              print(data);
                              if (_validation == "valid token") {
                                final newUser = await authenticateUser(
                                    widget.username, widget.password);
                                print(newUser);
                                user = users.getData(newUser);
                                userid = user[0].toString();
                                username = user[1].toString();
                                email = user[2].toString();
                                status = user[3].toString();
                                roleName = user[4].toString();
                                updateAt = user[5].toString();
                                updatedBy = user[6].toString();

                                final token = await createToken(
                                    widget.username, widget.password);
                                eToken = userToken.getData(token);

                                /* Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CreateProfilePage(
                                              username: username,
                                              email: email,
                                              userid: userid,
                                              password: widget.password,
                                            ))); */
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomeScreen(
                                            username: username,
                                            email: email,
                                            userid: userid,
                                            status: status,
                                            roleName: roleName,
                                            token: eToken)));
                              }
                            } catch (e) {
                              print(e);
                              errorMsg = 'Enter the correct OTP!';
                              final regErrorsnackBar =
                                  SnackBar(content: Text(errorMsg));
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(regErrorsnackBar);
                            }
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
                          onPressed: () {
                            _getOTP();
                          },
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

class OTPDialog extends StatefulWidget {
  final otpText;

  OTPDialog({@required this.otpText});

  @override
  _OTPDialogState createState() => _OTPDialogState();
}

class _OTPDialogState extends State<OTPDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: 70.0,
        width: 300.0,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                widget.otpText,
                style: TextStyle(color: Colors.black, fontSize: 22.0),
              ),
            ),
          ],
        ),
      ),
    );
    ;
  }
}
