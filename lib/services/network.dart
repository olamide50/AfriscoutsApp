import 'dart:async';
import 'dart:convert';
import 'package:afriscouts/const/secret.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:afriscouts/const/const.dart';

Future<String> createToken(String username, String password) async {
  try {
    final response = await http.post(
      Uri.parse(getTokenURL),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
          <String, String>{"password": "$password", "username": "$username"}),
    );

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return errorMessage;
    }
  } catch (e) {
    throw new HttpException(e);
  }
}

class Token {
  Token();
  getData(String data) {
    if (data != errorMessage) {
      var decoder = jsonDecode(data);
      var token = decoder['token'];
      return token;
    } else {
      return null;
    }
  }
}

Future<String> authenticateUser(String username, String password) async {
  try {
    final response = await http.post(
      Uri.parse(authenticateUserURL),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
          <String, String>{"password": "$password", "username": "$username"}),
    );

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return response.statusCode.toString();
    }
  } catch (e) {
    throw new HttpException(e);
  }
}

class UserAuth {
  UserAuth();
  getData(String data) {
    if (data != errorMessage) {
      var decoder = jsonDecode(data);
      var userid, username, email, status, roleName, updateAt, updatedBy;
      userid = decoder['result']['id'];
      username = decoder['result']['username'];
      email = decoder['result']['email'];
      status = decoder['result']['status'];
      roleName = decoder['result']['roleName'];
      updateAt = decoder['result']['updateAt'];
      updatedBy = decoder['result']['updatedBy'];

      return [userid, username, email, status, roleName, updateAt, updatedBy];
    } else {
      return null;
    }
  }
}

Future<String> registerUser(
    String username, String password, String email, String rollname) async {
  try {
    final response = await http.post(
      Uri.parse(registrationURL),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        <String, String>{
          "password": "$password",
          "username": "$username",
          "roleName": "$rollname",
          "email": "$email",
          "status": "0",
        },
      ),
    );

    if (response.statusCode == 200 || response.statusCode == 500) {
      return response.body;
    } else {
      return response.statusCode.toString();
    }
  } catch (e) {
    print(e);
    throw new HttpException(e);
  }
}

class User {
  var status, message, userid, username, email, rolename;

  User();
  getData(var data) {
    if (data != null) {
      var decoder = jsonDecode(data);
      print(decoder);
      status = decoder['status'].toString();
      message = decoder['message'].toString();
      userid = decoder['result']['id'].toString();
      username = decoder['result']['username'].toString();
      email = decoder['result']['email'].toString();
      rolename = decoder['result']['roleName'].toString();
      return [status, message, userid, username, email, rolename];
    } else {
      return null;
    }
  }
}

class Msg {
  var status, message;
  Msg();
  getData(var data) {
    if (data != null) {
      var decoder = jsonDecode(data);
      print(decoder);
      status = decoder['status'];
      message = decoder['message'];

      return [status, message];
    } else {
      return null;
    }
  }
}

Future<String> genOTP(url) async {
  try {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return response.body.toString();
    } else {
      return response.statusCode.toString();
    }
  } catch (e) {
    throw new HttpException(e);
  }
}

class OTP {
  String token;

  OTP();
  getData(var data) {
    if (data != null) {
      var decoder = jsonDecode(data);
      token = decoder['result']['token'].toString();
      return token;
    } else {
      return null;
    }
  }
}

Future<String> valOTP(String email, String token, String username) async {
  try {
    final response = await http.post(
      Uri.parse(valOtpURL),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "username": "$username",
        "token": "$token",
        "email": "$email"
      }),
    );

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return response.statusCode.toString();
    }
  } catch (e) {
    throw new HttpException(e);
  }
}

class CorrectOTP {
  String valid;

  CorrectOTP();
  getData(var data) {
    if (data != null) {
      var decoder = jsonDecode(data);
      valid = decoder['result']['message'].toString();
      print(valid);
      return valid;
    } else {
      return null;
    }
  }
}
