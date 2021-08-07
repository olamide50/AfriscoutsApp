import 'package:flutter/material.dart';
import 'package:afriscouts/const/custom.dart';

class ForgotPasswordPage extends StatefulWidget {
  final Function onPressedNext;

  const ForgotPasswordPage({
    @required this.onPressedNext,
  });

  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {

  final emailController = TextEditingController();

@override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 150, right: 20, left: 20, bottom: 10),
        child: Column(
          children: <Widget>[
            Text('Enter your email and press the submit button'),
            SizedBox(height: 20),
            AfriTextField(
              myController: emailController,
              borderRadiusValue: 25.0,
              hintText: 'Email',
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
            
          ],
        ));
  }
}
