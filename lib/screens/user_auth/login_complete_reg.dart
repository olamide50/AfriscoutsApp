import 'package:flutter/material.dart';
import 'package:afriscouts/const/custom.dart';
import 'package:afriscouts/screens/home_screen.dart';

class CreateProfilePage extends StatefulWidget {
  /// The text of SignIn button.
  final String hintFirstName;
  final String hintLastName;
  final String hintOtherNames;
  final String userID;
  final String hintDateOfBirth;
  final String hintProfession;
  final String hintHeight;
  final String hintCountryOfResidence;
  final String hintCareerHistory;
  final String modByTs;

  /// The text of SignUp button.
  final String buttonTextSubmit;

  final Color submitColor;

  final Color textFieldColor;

  final double borderRadiusValue;

  const CreateProfilePage({
    this.buttonTextSubmit = 'Submit',
    this.hintFirstName = 'First Name',
    this.hintLastName = 'Last Name',
    this.hintOtherNames = 'Other Names',
    this.userID = 'User',
    this.hintDateOfBirth = 'Date of Birth',
    this.hintProfession = 'Profession',
    this.hintHeight = 'Height',
    this.hintCountryOfResidence = 'Country',
    this.hintCareerHistory = ' Career Summary',
    this.modByTs = '',
    this.submitColor = const Color(0xFF2E2C2C),
    this.textFieldColor = const Color(0xFFFFFFFE),
    this.borderRadiusValue = 25.0,
  });

  @override
  _CreateProfilePageState createState() => _CreateProfilePageState();
}

class _CreateProfilePageState extends State<CreateProfilePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            title: Text('Create Profile'), leading: Icon(Icons.person_outline)),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(top: 20, right: 0, left: 5, bottom: 30),
            child: Column(children: <Widget>[
              Container(
                padding: EdgeInsets.only(
                    top: 0, bottom: 25.0, right: 25.0, left: 25.0),
                decoration: BoxDecoration(
                  color: Colors.white54,
                ),
                child: AfriTextField(
                  borderRadiusValue: widget.borderRadiusValue,
                  hintText: widget.hintFirstName,
                  textFieldColor: widget.textFieldColor,
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                    top: 0, bottom: 25.0, right: 25.0, left: 25.0),
                decoration: BoxDecoration(
                  color: Colors.white54,
                ),
                child: AfriTextField(
                  borderRadiusValue: widget.borderRadiusValue,
                  hintText: widget.hintLastName,
                  textFieldColor: widget.textFieldColor,
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                    top: 0, bottom: 25.0, right: 25.0, left: 25.0),
                decoration: BoxDecoration(
                  color: Colors.white54,
                ),
                child: AfriTextField(
                  borderRadiusValue: widget.borderRadiusValue,
                  hintText: widget.hintOtherNames,
                  textFieldColor: widget.textFieldColor,
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                    top: 0, bottom: 25.0, right: 25.0, left: 25.0),
                decoration: BoxDecoration(
                  color: Colors.white54,
                ),
                child: AfriTextField(
                  borderRadiusValue: widget.borderRadiusValue,
                  hintText: widget.hintDateOfBirth,
                  textFieldColor: widget.textFieldColor,
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                    top: 0, bottom: 25.0, right: 25.0, left: 25.0),
                decoration: BoxDecoration(
                  color: Colors.white54,
                ),
                child: AfriTextField(
                  borderRadiusValue: widget.borderRadiusValue,
                  hintText: widget.hintProfession,
                  textFieldColor: widget.textFieldColor,
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                    top: 0, bottom: 25.0, right: 25.0, left: 25.0),
                decoration: BoxDecoration(
                  color: Colors.white54,
                ),
                child: AfriTextField(
                  borderRadiusValue: widget.borderRadiusValue,
                  hintText: widget.hintHeight,
                  textFieldColor: widget.textFieldColor,
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                    top: 0, bottom: 25.0, right: 25.0, left: 25.0),
                decoration: BoxDecoration(
                  color: Colors.white54,
                ),
                child: AfriTextField(
                  borderRadiusValue: widget.borderRadiusValue,
                  hintText: widget.hintCountryOfResidence,
                  textFieldColor: widget.textFieldColor,
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                    top: 0, bottom: 25.0, right: 25.0, left: 25.0),
                decoration: BoxDecoration(
                  color: Colors.white54,
                ),
                child: AfriTextField(
                  borderRadiusValue: widget.borderRadiusValue,
                  hintText: widget.hintCareerHistory,
                  textFieldColor: widget.textFieldColor,
                ),
              ),
              Container(
                child: Center(
                  child: ConstrainedBox(
                    constraints:
                        BoxConstraints.tightFor(width: 310, height: 50),
                    child: AfriElevatedButton(
                      borderRadiusValue: widget.borderRadiusValue,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()));
                      },
                      loginText: widget.buttonTextSubmit,
                      textColor: widget.submitColor,
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
