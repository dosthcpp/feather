import 'package:country_picker/country_picker.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sns_mvp/components/write.dart';
import 'package:sns_mvp/pages/InputName.dart';
import 'package:sns_mvp/pages/InputUserName.dart';
import 'package:sns_mvp/pages/MainPage.dart';
import 'package:sns_mvp/pages/PhoneNum.dart';
import 'package:sns_mvp/pages/ReservingPage.dart';
import 'package:sns_mvp/pages/StartingPage.dart';
import 'package:sns_mvp/providers/UserProvider.dart';

final User user = User();

void main() {
  runApp(
    ChangeNotifierProvider<User>(
      create: (context) => user,
      child: Feather(),
    ),
  );
}

class Feather extends StatelessWidget {
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
        StartingPage.id: (context) => StartingPage(),
        PhoneNum.id: (context) => PhoneNum(),
        InputName.id: (context) => InputName(),
        InputUserName.id: (context) => InputUserName(),
        ReservingPage.id: (context) => ReservingPage(),
        MainPage.id: (context) => MainPage(),
        WritePage.id: (context) => WritePage(),
      },
    );
  }
}
