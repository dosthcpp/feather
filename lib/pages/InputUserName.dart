import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:sns_mvp/main.dart';
import 'package:sns_mvp/constants.dart';
import 'package:sns_mvp/pages/ReservingPage.dart';

class InputUserName extends StatelessWidget {
  static const id = 'input_username';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                "Username",
                style: TextStyle(
                  fontSize: 35.0,
                  fontWeight: FontWeight.w300,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "Please enter username",
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
                    CustomTextField(),
                  ],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              SizedBox(
                height: 80.0,
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
                      if (user.nickname.length != 0) {
                        await http.post(
                          Uri.https(baseUrl, '/register'),
                          body: {
                            "fname": user.fname,
                            "lname": user.lname,
                            "phoneNumber": '${user.phoneCode}-${user.phoneNum}',
                            "username": user.nickname,
                          },
                        ).then(
                          (res) async {
                            if (jsonDecode(res.body)["status"] == "success") {
                              Navigator.pushNamed(context, ReservingPage.id);
                            } else if (jsonDecode(res.body)["status"] ==
                                "failure") {
                              await showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: Text('Too bad!'),
                                  content: Text('Something gone wrong.'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context,
                                                rootNavigator: true)
                                            .pop();
                                      },
                                      child: Text('OK'),
                                    ),
                                  ],
                                ),
                              );
                            }
                          },
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
    );
  }
}

class CustomTextField extends StatefulWidget {
  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    _controller.text = '@';
  }

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
              offset: Offset(2.0, 2.0), // shadow direction: bottom right
            )
          ],
        ),
        child: TextField(
          controller: _controller,
          textAlign: TextAlign.center,
          keyboardType: TextInputType.text,
          onChanged: (_username) {
            if (_controller.text.isEmpty || _controller.text.endsWith('@')) {
              _controller.text = '@';
              _controller.selection = TextSelection.fromPosition(
                TextPosition(
                  offset: _controller.text.length,
                ),
              );
            } else {
              user.setNickname(_username);
            }
          },
          decoration: InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            contentPadding:
                EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
          ),
        ),
      ),
    );
  }
}
