import 'package:flutter/material.dart';
import 'package:afriscouts/const/custom.dart';

class ConfirmRegistration extends StatefulWidget {
  final Function onPressedNext;
  final Function onPressedResend;

  const ConfirmRegistration({
    @required this.onPressedNext,
    @required this.onPressedResend,
  });

  @override
  _ConfirmRegistrationState createState() => _ConfirmRegistrationState();
}

class _ConfirmRegistrationState extends State<ConfirmRegistration> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 150, right: 20, left: 20, bottom: 10),
        child: Column(
          children: <Widget>[
            Text(
                'Enter the 6 digit one Time password (OTP) sent to your email and press the submit button'),
            SizedBox(height: 20),
            AfriTextField(
              borderRadiusValue: 25.0,
              hintText: 'Enter OTP',
              textFieldColor: textFieldColor,
            ),
            SizedBox(height: 20),
            Container(
              child: Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints.tightFor(width: 310, height: 50),
                  child: AfriElevatedButton(
                    borderRadiusValue: borderRadiusValue,
                    onPressed: widget.onPressedNext,
                    loginText: loginText,
                    textColor: signinColor,
                  ),
                ),
              ),
            ),
            Container(
              child: Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints.tightFor(width: 310, height: 50),
                  child: TextButton(
                    onPressed: widget.onPressedResend,
                    child: Text('Resend OTP',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
