import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:afriscouts/const/secret.dart';

Future createToken(String username, String password) async {
  final response = await http.post(
    Uri.parse(getTokenURL),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(
        <String, String>{"password": "$password", "username": "$username"}),
  );

  if (response.statusCode == 200) {
    print(response.body);
    return response.body;
  } else {
    print(response.statusCode);
    return response.statusCode;
  }
}

class Token {
  Token();
  getData(String data) {
    var decoder = jsonDecode(data);
    var token = decoder['token'];
    return token;
  }
}

Future registerUser(
    String username, String password, String email, String rollname) async {
  final response = await http.post(
    Uri.parse(registrationURL),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      "password": "$password",
      "username": "$username",
      "rollName": "$rollname",
      "email": "$email"
    }),
  );

  if (response.statusCode == 200 || response.statusCode == 500) {
    print(response.statusCode);
    return response.statusCode;
  } else {
    print(response.statusCode);
    return response.statusCode;
  }
}

class User {
  User();
  getData(var data) {
    var decoder = jsonDecode(data.toString());
    print(decoder);
    /* var status = decoder['statusCode'];
    print(status); */
    return decoder;
  }
}
