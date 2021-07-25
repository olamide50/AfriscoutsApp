import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

final getTokenURL =
    'http://134.209.73.94:8080/afriscout-api/token/generate-token';
final registrationURL = 'http://134.209.73.94:8080/afriscout-api/user/register';

Future<Token> createToken(String username, String password) async {
  final response = await http.post(
    Uri.parse(getTokenURL),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'username': username,
      'password': password,
    }),
  );

  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return Token.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create token.');
  }
}

class Token {
  final String username;
  final String password;

  Token({@required this.username, @required this.password});

  factory Token.fromJson(Map<String, dynamic> json) {
    return Token(
      username: json['username'],
      password: json['password'],
    );
  }
}
