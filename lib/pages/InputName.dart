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
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 20 * 3.5,
                ),
                Text(
                  "Name",
                  style: TextStyle(
                    fontSize: 35.0,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  "Please enter your name",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w200,
                  ),
                ),
                SizedBox(
                  height: 80.0,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 50.0,
                  ),
                  child: Row(
                    children: [
                      CustomTextField(
                        hintText: "First name",
                        onChanged: (_firstName) {
                          user.setFName(_firstName);
                        },
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      CustomTextField(
                        hintText: "Last name",
                        onChanged: (_lastName) {
                          user.setLName(_lastName);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 10 * 4,
                  child: Material(
                    color: Color(0xff6998a7),
                    borderRadius: BorderRadius.circular(
                      10.0,
                    ),
                    child: MaterialButton(
                      child: Text(
                        "Cancel",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 20 * 1,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 10 * 4,
                  child: Material(
                    color: Color(0xff5772a1),
                    borderRadius: BorderRadius.circular(
                      10.0,
                    ),
                    child: MaterialButton(
                      child: Text(
                        "Next",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
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
                SizedBox(
                  height: MediaQuery.of(context).size.height / 10 * 2.5,
                )
              ],
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
          borderRadius: BorderRadius.circular(5.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[400],
              blurRadius: 2.0,
              spreadRadius: 1.0,
              offset: Offset(
                  2.0, 2.0), // shadow direction: bottom right
            )
          ],
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
