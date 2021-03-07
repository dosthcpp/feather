import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'package:sns_mvp/main.dart';
import 'package:sns_mvp/constants.dart';
import 'package:sns_mvp/pages/MainPage.dart';

class ReservingPage extends StatefulWidget {
  static const id = 'reserving_page';

  @override
  _ReservingPageState createState() => _ReservingPageState();
}

class _ReservingPageState extends State<ReservingPage> {
  Future<String> fetchNickname() async {
    final response = await http.post(Uri.http(baseUrl, '/check'), body: {
      'phoneNumber': '${user.phoneCode}-${user.phoneNum}',
    });
    if(response.statusCode == 200) {
      if ((jsonDecode(response.body)["nickname"]).length != 0) {
        return Future<String>.value(jsonDecode(response.body)["nickname"]);
      } else {
        return Future<String>.value('@Anonymous');
      }
    } else {
      throw Exception('Failed to load!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/congratulations.png',
                width: 23.0,
              ),
              Text(
                "We\'ve reserved",
                style: TextStyle(
                  fontSize: 23.0,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 5.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FutureBuilder<String>(
                  future: fetchNickname(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Text(
                        snapshot.data,
                        style: TextStyle(
                          fontSize: 23.0,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    }
                    return CircularProgressIndicator();
                  }),
              Text(
                " for you, and",
                style: TextStyle(
                  fontSize: 23.0,
                ),
              ),
            ],
          ),
          Text(
            "we\'ll text you as soon as\nyour account is ready!",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 23.0,
              height: 1.5,
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          Text(
            "To learn more about Feather you can",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12.0,
              height: 1.5,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "read our blog post. Thank you!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12.0,
                  height: 1.5,
                ),
              ),
              Image.asset(
                'assets/please.png',
                width: 15.0,
              ),
            ],
          ),
          SizedBox(
            height: 40.0,
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              "Get your invite text? Sign in ->",
              style: TextStyle(
                fontSize: 12.0,
                height: 1.5,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, MainPage.id);
            },
            child: Text(
              "Get to the next page->",
              style: TextStyle(
                fontSize: 12.0,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
