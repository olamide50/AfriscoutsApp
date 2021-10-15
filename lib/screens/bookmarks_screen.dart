import 'package:flutter/material.dart';

class BookmarksScreen extends StatefulWidget {
  static const id = 'bookmarks_screen';

  @override
  _BookmarksScreenState createState() => _BookmarksScreenState();
}

class _BookmarksScreenState extends State<BookmarksScreen> {
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
          'Bookmarks',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
    );
  }
}
