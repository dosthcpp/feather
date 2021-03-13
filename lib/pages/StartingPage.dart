import 'package:flutter/material.dart';

import 'package:sns_mvp/main.dart';
import 'package:sns_mvp/pages/InputUserName.dart';
import 'package:sns_mvp/pages/PhoneNum.dart';

class StartingPage extends StatelessWidget {
  static const id = 'starting_page';

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
                  "Feather",
                  style: TextStyle(
                    fontSize: 35.0,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  "Welcome to Feather!",
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
                  child: Column(
                    children: [
                      CustomTextField(
                        hintText: "Username",
                        onChanged: (_firstName) {
                          user.setFName(_firstName);
                        },
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      CustomTextField(
                        hintText: "Password",
                        onChanged: (_lastName) {
                          user.setLName(_lastName);
                        },
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 10 * 8,
                        child: Material(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(
                            10.0,
                          ),
                          child: MaterialButton(
                            child: Text(
                              "Sign In",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                              ),
                            ),
                            onPressed: () async {

                            },
                          ),
                        ),
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
                  width: MediaQuery.of(context).size.width / 10 * 8,
                  child: Material(
                    color: Color(0xff5772a1),
                    borderRadius: BorderRadius.circular(
                      10.0,
                    ),
                    child: MaterialButton(
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, PhoneNum.id);
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
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[400],
            blurRadius: 2.0,
            spreadRadius: 1.0,
            offset: Offset(2.0, 2.0), // shadow direction: bottom right
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
    );
  }
}
