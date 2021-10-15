import 'package:flutter/material.dart';
import 'package:afriscouts/const/custom.dart';
import 'package:country_picker/country_picker.dart';

class CreateProfilePage extends StatefulWidget {
  /// The text of SignIn button.
  final String userid;
  final String username;
  final String email;
  final String password;

  /// The text of SignUp button.
  final String buttonTextSubmit;

  final Color submitColor;

  final Color textFieldColor;

  final double borderRadiusValue;

  const CreateProfilePage({
    this.buttonTextSubmit = 'Submit',
    this.userid,
    this.username,
    this.email,
    this.password,
    this.submitColor = const Color(0xFF2E2C2C),
    this.textFieldColor = const Color(0xFFFFFFFE),
    this.borderRadiusValue = 25.0,
  });

  @override
  _CreateProfilePageState createState() => _CreateProfilePageState();
}

class _CreateProfilePageState extends State<CreateProfilePage> {
  String firstname,
      lastname,
      password,
      othername,
      dateOfBirth,
      careerHistory,
      height,
      country,
      _country = "Select Country",
      profession,
      modByTs = "No";

  DateTime selectedDate = DateTime.now();
  int day, month, year;
  String _dob = "Select Date of Birth";
  Future<void> _selectedDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        day = picked.day;
        month = picked.month;
        year = picked.year;
        _dob = '$month/$day/$year';
        dateOfBirth = selectedDate.toString();
      });
  }

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
                child: TextField(
                  onChanged: (value) {
                    firstname = value;
                  },
                  autofocus: false,
                  obscureText: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(widget.borderRadiusValue),
                    ),
                    filled: true,
                    hintStyle: TextStyle(color: Colors.grey[800]),
                    hintText: 'Firstname*',
                    fillColor: widget.textFieldColor,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                    top: 0, bottom: 25.0, right: 25.0, left: 25.0),
                decoration: BoxDecoration(
                  color: Colors.white54,
                ),
                child: TextField(
                  onChanged: (value) {
                    lastname = value;
                  },
                  autofocus: false,
                  obscureText: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(widget.borderRadiusValue),
                    ),
                    filled: true,
                    hintStyle: TextStyle(color: Colors.grey[800]),
                    hintText: 'Lastname*',
                    fillColor: widget.textFieldColor,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                    top: 0, bottom: 25.0, right: 25.0, left: 25.0),
                decoration: BoxDecoration(
                  color: Colors.white54,
                ),
                child: TextField(
                  onChanged: (value) {
                    othername = value;
                  },
                  autofocus: false,
                  obscureText: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(widget.borderRadiusValue),
                    ),
                    filled: true,
                    hintStyle: TextStyle(color: Colors.grey[800]),
                    hintText: 'Other names',
                    fillColor: widget.textFieldColor,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                    top: 0, bottom: 25.0, right: 25.0, left: 25.0),
                decoration: BoxDecoration(
                  color: Colors.white54,
                ),
                child: TextField(
                  onChanged: (value) {
                    height = value;
                  },
                  autofocus: false,
                  obscureText: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(widget.borderRadiusValue),
                    ),
                    filled: true,
                    hintStyle: TextStyle(color: Colors.grey[800]),
                    hintText: 'Height*',
                    fillColor: widget.textFieldColor,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                    top: 0, bottom: 25.0, right: 25.0, left: 25.0),
                decoration: BoxDecoration(
                  color: Colors.white54,
                ),
                child: TextField(
                  onChanged: (value) {
                    profession = value;
                  },
                  autofocus: false,
                  obscureText: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(widget.borderRadiusValue),
                    ),
                    filled: true,
                    hintStyle: TextStyle(color: Colors.grey[800]),
                    hintText: 'Profession*',
                    fillColor: widget.textFieldColor,
                  ),
                ),
              ),
              Container(
                  padding: EdgeInsets.only(
                      top: 0, bottom: 25.0, right: 25.0, left: 25.0),
                  height: 80.0,
                  decoration: BoxDecoration(
                    color: Colors.white54,
                  ),
                  child: FractionallySizedBox(
                    alignment: Alignment.center,
                    widthFactor: 1.0,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        side: BorderSide(
                          width: 1.0,
                          color: Colors.black,
                        ),
                        primary:
                            Colors.white, //change background color of button
                        onPrimary: Colors.black87, //change text color of button
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(widget.borderRadiusValue),
                        ),
                        elevation: 1.0,
                      ),
                      onPressed: () {
                        showCountryPicker(
                          context: context,
                          showPhoneCode:
                              false, // optional. Shows phone code before the country name.
                          onSelect: (Country cont) {
                            country = cont.name;
                            setState(() {
                              _country = country;
                            });
                          },
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            _country,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                          ),
                          Icon(
                            Icons.arrow_drop_down_outlined,
                            color: Colors.black,
                          )
                        ],
                      ),
                    ),
                  )),
              Container(
                padding: EdgeInsets.only(
                    top: 0, bottom: 25.0, right: 25.0, left: 25.0),
                /* decoration: BoxDecoration(
                  color: Colors.white54,
                ), */
                child: TextField(
                  onTap: () {
                    
                    setState(() {
                      _selectedDate(context);
                    });
                  },
                  controller: TextEditingController.fromValue(
                      TextEditingValue(text: _dob)),
                  onChanged: (value) {
                    dateOfBirth = value;
                  },
                  autofocus: false,
                  obscureText: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(widget.borderRadiusValue),
                    ),
                    filled: true,
                    hintStyle: TextStyle(color: Colors.grey[800]),
                    hintText: "Date of Birth",
                    fillColor: widget.textFieldColor,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                    top: 0, bottom: 25.0, right: 25.0, left: 25.0),
                decoration: BoxDecoration(
                  color: Colors.white54,
                ),
                child: TextField(
                  onChanged: (value) {
                    careerHistory = value;
                  },
                  autofocus: false,
                  obscureText: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(widget.borderRadiusValue),
                    ),
                    filled: true,
                    hintStyle: TextStyle(color: Colors.grey[800]),
                    hintText: 'Career History',
                    fillColor: widget.textFieldColor,
                  ),
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
                        /*  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomeScreen(
                                            username: username,
                                            email: email,
                                            userid: userid,
                                            status: status,
                                            roleName: roleName,
                                            token: eToken))); */
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
