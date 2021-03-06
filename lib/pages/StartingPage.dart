import 'package:flutter/material.dart';
import 'package:sns_mvp/pages/PhoneNum.dart';

class StartingPage extends StatelessWidget {
  static const id = 'starting_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.only(
            left: 50.0,
            right: 50.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Image.asset(
                    'assets/congratulations.png',
                    width: 30.0,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    "Welcome!",
                    style: TextStyle(
                      fontSize: 25.0,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30.0,
              ),
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "We're working hard to get Feather ready for everyone! while we wrap up the finishing touches, we're adding people gradually to make sure nothing breaks. :)",
                      style: TextStyle(
                        fontSize: 15.0,
                        height: 1.6,
                      ),
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    Text(
                      "Anyone can join with an invite from an existing user -- or reserve your username and we'll text you if you have a friend on the app who can let you in.",
                      style: TextStyle(
                        fontSize: 15.0,
                        height: 1.6,
                      ),
                    ),
                    Text(
                      "We are so grateful you're here and can't wait to have you join!",
                      style: TextStyle(
                        fontSize: 15.0,
                        height: 1.6,
                      ),
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    Text(
                      "Tony, the Feather team",
                      style: TextStyle(
                        fontSize: 15.0,
                        height: 1.6,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
              Align(
                alignment: Alignment.center,
                child: Material(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(
                    30.0,
                  ),
                  child: MaterialButton(
                    minWidth: 0,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.0,
                      ),
                      child: Text(
                        "Get your username ->",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, PhoneNum.id);
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Align(
                alignment: Alignment.center,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "Have an invite text? Sign in ->",
                    style: TextStyle(
                      color: Colors.blueAccent,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
