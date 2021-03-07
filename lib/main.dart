import 'package:country_picker/country_picker.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:flutter/material.dart';
import 'package:sns_mvp/components/write.dart';
import 'package:sns_mvp/pages/MainPage.dart';
import 'package:sns_mvp/pages/PhoneNum.dart';
import 'package:sns_mvp/pages/StartingPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: [
        Locale('en'),
        Locale('ko'),
      ],
      localizationsDelegates: [
        CountryLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      title: 'Feather',
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xfff5f5dc),
      ),
      initialRoute: StartingPage.id,
      routes: {
        MainPage.id: (context) => MainPage(),
        WritePage.id: (context) => WritePage(),
        StartingPage.id: (context) => StartingPage(),
        PhoneNum.id: (context) => PhoneNum(),
      },
    );
  }
}
