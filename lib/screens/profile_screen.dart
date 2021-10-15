import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  static const id = 'profile_screen';

  final username, password, email, userid, status, roleName, token;
  final String imageURL;

  ProfileScreen(
      {this.email,
      this.username,
      this.imageURL,
      this.password,
      this.status,
      this.roleName,
      this.token,
      this.userid});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Widget _role(String value) {
    const _style = TextStyle(
        color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20);
    if (value == 'ROLE_JOURNALISTS') {
      return Text('Journalist', style: _style);
    } else if (value == 'ROLE_SCOUT') {
      return Text('scout', style: _style);
    } else {
      return Text('Athelete', style: _style);
    }
  }

  TextStyle _style = TextStyle(color: Colors.black87, fontSize: 22);
  double _vSpace = 10.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 1,
          leading: Container(
              margin: const EdgeInsets.all(10.0),
              child: IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: () {
                    Navigator.pop(context);
                  })),
          backgroundColor: Colors.white,
          title: Text(
            'Profile',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
            child: Container(
                padding: EdgeInsets.all(30),
                child: Column(
                  children: [
                    Center(
                        child: GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) {
                            return DetailScreen(imageURL: widget.imageURL);
                          }));
                        },
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(widget.imageURL),
                          minRadius: 40,
                          maxRadius: 80,
                        ),
                      ),
                        ),
                    Text(
                      widget.username != null ? widget.username : '',
                      style: TextStyle(color: Colors.black87, fontSize: 40),
                    ),
                    _role(widget.roleName),
                    SizedBox(height: _vSpace * 2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text('GENDER', style: _style),
                            SizedBox(height: _vSpace),
                            Text('JOINED', style: _style),
                            SizedBox(height: _vSpace),
                            Text('SPORT', style: _style),
                            SizedBox(height: _vSpace),
                            Text('AGE', style: _style),
                            SizedBox(height: _vSpace),
                            Text('LOCATION', style: _style),
                            SizedBox(height: _vSpace),
                            Text('CONTACTS', style: _style),
                            SizedBox(height: _vSpace),
                          ],
                        ),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Female', style: _style),
                            SizedBox(height: _vSpace),
                            Text('June 2021', style: _style),
                            SizedBox(height: _vSpace),
                            Text('Soccer', style: _style),
                            SizedBox(height: _vSpace),
                            Text('22', style: _style),
                            SizedBox(height: _vSpace),
                            Text('Nigeria', style: _style),
                            SizedBox(height: _vSpace),
                            Text('40', style: _style),
                            SizedBox(height: _vSpace),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              TextButton(
                                  child: Text('View Contacts',
                                      style: TextStyle(
                                          color: Colors.blue, fontSize: 18)),
                                  onPressed: () {}),
                            ],
                            crossAxisAlignment: CrossAxisAlignment.start,
                          ),
                        ),
                        Column(
                          children: [
                            TextButton(
                                child: Text('Edit',
                                    style: TextStyle(
                                        color: Colors.blue, fontSize: 18)),
                                onPressed: () {}),
                          ],
                          crossAxisAlignment: CrossAxisAlignment.end,
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.black,
                    ),
                  ],
                  // mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                ))));
  }
}

class DetailScreen extends StatelessWidget {
  final String imageURL;
  DetailScreen({@required this.imageURL});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Center(
          child: Hero(
            tag: 'imageHero',
            child: Stack(
              alignment: AlignmentDirectional.center,
              clipBehavior: Clip.none,
              children: [
                Image(
                  color: Colors.black,
                  image: AssetImage('assets/images/icon.jpg'),
                  height: double.infinity,
                  width: double.infinity,
                  alignment: Alignment.center,
                ),
                Image(
                  image: NetworkImage(imageURL),
                  fit: BoxFit.fitHeight,
                  //height: double.infinity,
                  width: double.infinity,
                  alignment: Alignment.center,
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
