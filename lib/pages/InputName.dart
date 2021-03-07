import 'package:flutter/material.dart';

import 'package:sns_mvp/main.dart';
import 'package:sns_mvp/pages/InputUserName.dart';

class InputName extends StatelessWidget {
  static const id = 'input_name';

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "What\'s your full name?",
              style: TextStyle(
                fontSize: 23.0,
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: Row(
                children: [
                  CustomTextField(
                    hintText: "First",
                    onChanged: (_firstName) {
                      user.setFName(_firstName);
                    },
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  CustomTextField(
                    hintText: "Last",
                    onChanged: (_lastName) {
                      user.setLName(_lastName);
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              "People use real names on Feather :) Thnx!",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 12.0,
              ),
            ),
            SizedBox(
              height: 80.0,
            ),
            Align(
              alignment: Alignment.center,
              child: Material(
                color: Colors.grey[400],
                borderRadius: BorderRadius.circular(
                  30.0,
                ),
                child: MaterialButton(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 50.0,
                    ),
                    child: Text(
                      "Next ->",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                  onPressed: () async {
                    if (user.fname.length != 0 && user.lname.length != 0) {
                      Navigator.pushNamed(context, InputUserName.id);
                    } else {
                      await showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Alert!'),
                          content: Text('Please fill out the blank.'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context, rootNavigator: true)
                                    .pop();
                              },
                              child: Text('OK'),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final hintText;
  final Function onChanged;

  CustomTextField({this.hintText, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: TextField(
          textAlign: TextAlign.center,
          keyboardType: TextInputType.text,
          onChanged: onChanged,
          decoration: InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            contentPadding:
                EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
            hintText: hintText,
            hintStyle: TextStyle(
              fontSize: 18.0,
            ),
          ),
        ),
      ),
    );
  }
}
