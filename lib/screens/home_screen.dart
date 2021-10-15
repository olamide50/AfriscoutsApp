import 'package:afriscouts/const/custom.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:afriscouts/const/const.dart';
import 'package:flutter_image_slider/carousel.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:afriscouts/screens/new_search.dart';

import 'package:afriscouts/services/network.dart';

class HomeScreen extends StatefulWidget {
  static const id = 'home_screen';

  //Arguments
  final username, password, email, userid, status, roleName, token;

  HomeScreen(
      {this.username,
      this.password,
      this.email,
      this.userid,
      this.status,
      this.roleName,
      this.token});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int bottomSelectedIndex = 0;

  PageController _myPage = PageController(
    initialPage: 0,
    keepPage: true,
  );
  var selectedPage;

  String roleName;

  void _onItemTapped(int index) {
    setState(() {
      bottomSelectedIndex = index;
      _myPage.animateToPage(index,
          duration: Duration(milliseconds: 500), curve: Curves.ease);
    });
  }

  void pageChanged(int index) {
    setState(() {
      bottomSelectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();

    if (widget.roleName == 'ROLE_ATHLETE') {
      roleName = 'Athlete';
    } else if (widget.roleName == 'ROLE_SCOUT') {
      roleName = 'Scout';
    } else if (widget.roleName == 'ROLE_JOURNALIST') {
      roleName = 'Journalist';
    } else {
      roleName = '';
    }

    _myPage = PageController(initialPage: 0);
    selectedPage = 0;

    print(widget.token);
    print(widget.roleName);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: new AppBar(
        elevation: 1,
        leading: Builder(
          builder: (context) => Container(
              margin: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  elevation: MaterialStateProperty.all(0),
                  padding: MaterialStateProperty.all(EdgeInsets.all(0)),
                ),
                onPressed: () => Scaffold.of(context).openDrawer(),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://images.unsplash.com/photo-1485290334039-a3c69043e517?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTYyOTU3NDE0MQ&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=300'),
                ),
              )),
        ),
        backgroundColor: Colors.white,
        title: Image(
          width: 40.0,
          height: 40.0,
          image: AssetImage('assets/images/icon.jpg'),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              icon: FaIcon(FontAwesomeIcons.search, color: Colors.black54),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NewSearch(
                      query: '',
                    ),
                  ),
                );
              }),
        ],
      ),
      drawer: new AppDrawer(
          password: widget.password,
          status: widget.status,
          userid: widget.userid,
          token: widget.token,
          roleName: widget.roleName,
          email: widget.email,
          username: widget.username,
          imageURL:
              'https://images.unsplash.com/photo-1485290334039-a3c69043e517?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTYyOTU3NDE0MQ&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=300'),
      body: PageView(
          physics: NeverScrollableScrollPhysics(),
          onPageChanged: (index) {
            pageChanged(index);
          },
          controller: _myPage,
          children: <Widget>[
            SafeArea(
                child: SingleChildScrollView(
              child: Container(
                  margin: EdgeInsets.all(0.0),
                  padding: EdgeInsets.all(0.0),
                  child: Column(
                    children: [
                      Container(
                        height: size.height,
                        width: size.width,
                        child: Column(
                          children: [
                            Text("Good morning"),
                            Row(children: [

                            ])
,                            Container(
                                height: size.height * 0.3,
                                width: size.width * 0.95,
                                child: Carousel(
                                  indicatorBarColor:
                                      Colors.black.withOpacity(0.2),
                                  autoScrollDuration: Duration(seconds: 2),
                                  animationPageDuration:
                                      Duration(milliseconds: 500),
                                  activateIndicatorColor: Colors.black,
                                  animationPageCurve: Curves.bounceInOut,
                                  indicatorBarHeight: 30,
                                  indicatorHeight: 10,
                                  indicatorWidth: 10,
                                  unActivatedIndicatorColor: Colors.grey,
                                  stopAtEnd: false,
                                  autoScroll: true,
                                  // widgets
                                  items: [
                                    Container(
                                      child: Image.network(
                                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS3rq1yfSS7kTHPD1j4Xwp92YB2YNZpeyOnTQ&usqp=CAU',
                                          fit: BoxFit.fill),
                                    ),
                                    Container(
                                      child: Image.network(
                                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRD0z21SFBagu77vap_aSOVIfgQbjUXriOF3w&usqp=CAU',
                                          fit: BoxFit.fill),
                                    ),
                                    Container(
                                      child: Image.network(
                                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTMgDZKgf7ppzeXt13twjRHxC-Hd5FVvoIZ5w&usqp=CAU',
                                          fit: BoxFit.fill),
                                    ),
                                    Container(
                                      child: Image.network(
                                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQKGkIMaaMXsAXc8ZWpD_CROyZXkqVLtfZXBQ&usqp=CAU',
                                          fit: BoxFit.fill),
                                    ),
                                    Container(
                                      child: Image.network(
                                          'https://picsum.photos/250?image=13',
                                          fit: BoxFit.fill),
                                    )
                                  ],
                                ))
                          ],
                        ),
                      )
                    ],
                  )),
            )),
            Center(child: Text("Messages")),
            Center(child: Text("Contacts")),
          ]),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.envelope),
            label: 'Inbox',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.addressBook),
            label: 'Contacts',
          ),
        ],
        currentIndex: bottomSelectedIndex,
        selectedItemColor: Colors.orange[600],
        unselectedItemColor: Colors.blueGrey,
        onTap: (index) {
          _onItemTapped(index);
        },
      ),
    );
  }
}
