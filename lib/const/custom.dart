import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

final signinColor = const Color(0xFF2E2C2C);
final textFieldColor = const Color(0xFFFFFFFE);
final borderRadiusValue = 25.0;
final loginText = 'Submit';

class AfriTextField extends StatefulWidget {
  final double borderRadiusValue;
  final String hintText;
  final Color textFieldColor;
  final myController;

  const AfriTextField({
    @required this.borderRadiusValue,
    @required this.hintText,
    @required this.textFieldColor,
    @required this.myController,
  });

  _AfriTextFieldState createState() => _AfriTextFieldState();
}

class _AfriTextFieldState extends State<AfriTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadiusValue),
          ),
          filled: true,
          hintStyle: TextStyle(color: Colors.grey[800]),
          hintText: widget.hintText,
          fillColor: widget.textFieldColor),
      controller: widget.myController,
    );
  }
}

class AfriElevatedButton extends StatefulWidget {
  final double borderRadiusValue;
  final Function onPressed;
  final String loginText;
  final Color textColor;

  const AfriElevatedButton({
    @required this.borderRadiusValue,
    @required this.onPressed,
    @required this.loginText,
    @required this.textColor,
  });

  @override
  _AfriElevatedButtonState createState() => _AfriElevatedButtonState();
}

class _AfriElevatedButtonState extends State<AfriElevatedButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed,
      child: Text(widget.loginText),
      style: ButtonStyle(
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius:
                BorderRadius.all(Radius.circular(widget.borderRadiusValue)),
          )),
          backgroundColor: MaterialStateProperty.all(Colors.blue[400]),
          padding: MaterialStateProperty.all(EdgeInsets.all(10)),
          textStyle: MaterialStateProperty.all(
              TextStyle(fontSize: 20, color: widget.textColor))),
    );
  }
}

const spinkit = SpinKitThreeBounce(
  color: Colors.blue,
  size: 50.0,
);

final regErrorsnackBar = SnackBar(content: Text('Error creating user!'));
