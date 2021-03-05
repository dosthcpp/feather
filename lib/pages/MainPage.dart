import 'package:flutter/material.dart';
import 'package:sns_mvp/components/write.dart';

class MainPage extends StatelessWidget {
  static const id = 'main_page';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("SNS MVP"),
        ),
        body: Column(
          children: [
            TextButton(
              child: Text("독후감 쓰기"),
              onPressed: () {
                Navigator.pushNamed(context, WritePage.id);
              },
            )
          ],
        )
    );
  }
}