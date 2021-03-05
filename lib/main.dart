import 'package:flutter/material.dart';
import 'package:sns_mvp/components/write.dart';
import 'package:sns_mvp/pages/MainPage.dart';
import 'package:sns_mvp/pages/StartingPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: StartingPage.id,
      routes: {
        MainPage.id: (context) => MainPage(),
        WritePage.id: (context) => WritePage(),
        StartingPage.id: (context) => StartingPage(),
      }
    );
  }
}