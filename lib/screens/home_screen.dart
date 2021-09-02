import 'package:afriscouts/const/custom.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:afriscouts/const/const.dart';
import 'package:flutter_image_slider/carousel.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:afriscouts/screens/new_search.dart';

class HomeScreen extends StatefulWidget {
  static const id = 'home_screen';

  //Arguments
  final username, password, email, userid, status;

  HomeScreen(
      {this.username, this.password, this.email, this.userid, this.status});

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
    _myPage = PageController(initialPage: 0);
    selectedPage = 0;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
            child: Container(
              color: Colors.white,
              child: TopPanel(
                  id: widget.username,
                  category: 'Scout',
                  icon: FaIcon(FontAwesomeIcons.userCircle)),
            ),
            preferredSize: Size.fromHeight(kToolbarHeight * 1.5)),
        title: Text("Afriscouts",
            style: GoogleFonts.sonsieOne(
              fontStyle: FontStyle.italic,
              fontSize: 28.0,
            )),
        actions: <Widget>[
          IconButton(
              icon: FaIcon(FontAwesomeIcons.search),
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
      drawer: Container(
        child: drawerWidget(context),
        width: 230,
      ),
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
                            Container(
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
            Center(child: Text("Users Feeds")),
            Center(child: Text("Messages")),
            Center(child: Text("Contacts")),
            Center(child: Text("Profile")),
          ]),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.feed),
            label: 'Feed',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.inbox),
            label: 'Inbox',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contacts),
            label: 'Contacts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
        currentIndex: bottomSelectedIndex,
        selectedItemColor: Colors.blue[800],
        unselectedItemColor: Colors.blueGrey,
        onTap: (index) {
          _onItemTapped(index);
        },
      ),
    );
  }
}
