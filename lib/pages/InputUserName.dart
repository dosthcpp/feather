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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Pick a username",
            style: TextStyle(
              fontSize: 23.0,
            ),
          ),
          SizedBox(
            height: 50.0,
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
                  if(user.nickname.length != 0) {
                    await http.post(
                      Uri.http(baseUrl, '/register'),
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
                        } else if(jsonDecode(res.body)["status"] == "failure"){
                          await showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text('Too bad!'),
                              content: Text('Something gone wrong.'),
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
                    );
                  }
                },
              ),
            ),
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
          borderRadius: BorderRadius.circular(15.0),
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
