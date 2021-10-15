import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NewSearch extends StatefulWidget {
  static String id = 'Search';
  static String headerText = 'Search';

  final String query;
  NewSearch({this.query});
  @override
  _NewSearchState createState() => _NewSearchState();
}

class _NewSearchState extends State<NewSearch> {
  static String querySearch;

  static int pageSize = 20;
  List<String> username = [];
  List<String> name = [];
  List<String> role = [];
  List<String> contacts = [];
  List<String> age = [];
  List<String> gender = [];
  List<String> location = [];
  List<String> imageString = [];
  int number = pageSize;
  int pop = 1;
  String empty = 'No info';
  bool isLoading = false;
  static String _selectedUrl;

  bool con = true;
  String conErrorMsg;
  final searchController = TextEditingController(text: querySearch);

  void _search(String _selectedUrl) async {
    /* try {
      _futureNews = (await fetchNews(_selectedUrl));

      if (_futureNews == retry) {
        setState(() {
          isLoading = false;
        });
        Navigator.pushNamed(context, RetrySearch.id);
      } else {
        setState(() {
          isLoading = false;
        });
        news = decoder.getData(_futureNews, source, title, content, description,
            imageString, author, time, url, number, empty);

        source = news[0];
        title = news[1];
        content = news[2];
        description = news[3];
        imageString = news[4];
        author = news[5];
        time = news[6];
        url = news[7];

        setState(() {});
      }
    } catch (e) {
      con = false;
      conErrorMsg = e.toString();
    } */
  }

  @override
  void initState() {
    super.initState();

    //setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.orange[600],
          leading: IconButton(
            icon: FaIcon(FontAwesomeIcons.times),
            onPressed: () {
              Navigator.pop((context));
            },
          ),
          title: Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: TextField(
                controller: searchController,
                /* onChanged: (value) {
                  querySearch = value;
                  if (querySearch == null) {
                    querySearch = 'all';
                  }
                }, */
                autocorrect: true,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontFamily: 'Calibri',
                ),
              )),
          actions: <Widget>[
            ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                )),
              ),
              child: Text('Search',
                  style: TextStyle(color: Colors.white70, fontSize: 18.0)),
              onPressed: () {
                querySearch = searchController.text;
                _selectedUrl = 'url';
                isLoading = true;
                _search(_selectedUrl);
              },
            ),
          ],
        ),
        body: SafeArea(child: Center()));
  }
}
