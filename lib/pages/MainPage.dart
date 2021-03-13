import 'dart:convert';
import 'dart:async';

import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:sns_mvp/constants.dart';
import 'package:sns_mvp/main.dart';

class MainPage extends StatelessWidget {
  static const id = 'main_page';

  Future<Map<String, String>> fetchUserInfo() async {
    final response = await http.post(Uri.https(baseUrl, '/check2'), body: {
      'phoneNumber': '${user.phoneCode}-${user.phoneNum}',
    });
    if (response.statusCode == 200) {
      final parsed = jsonDecode(response.body);
      print(parsed);
      if (Map.from(parsed).isNotEmpty) {
        return Future<Map<String, String>>.value({
          'fname': parsed['fname'],
          'lname': parsed['lname'],
          'username': parsed['username'],
        });
      } else {
        return Future<Map<String, String>>.value({
          'fname': 'not available',
          'lname': 'not available',
          'username': 'not available',
        });
      }
    } else {
      throw Exception('Failed to load!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Feather"),
        backgroundColor: Colors.blueAccent,
      ),
      body: FutureBuilder(
        future: fetchUserInfo(),
        builder: (context, snapshot) {
          if(snapshot.hasData) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Userinfo"),
                Text("phone no : ${user.phoneNum}"),
                Text("fname : ${snapshot.data['fname']}"),
                Text("lanme : ${snapshot.data['lname']}"),
                Text("username : ${snapshot.data['username']}"),
              ],
            );
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
