import 'package:flutter/material.dart';

class RetrySearch extends StatelessWidget {
  static String id = 'retry_search';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.orange[600],
          title: Text('Error Fetching Data'),
        ),
        body: SafeArea(
          child: Center(
            child: Container(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Retry'),
              ),
            ),
          ),
        ));
  }
}