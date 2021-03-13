import 'package:flutter/material.dart';

class ReservingPage extends StatefulWidget {
  static const id = 'reserving_page';

  @override
  _ReservingPageState createState() => _ReservingPageState();
}

class _ReservingPageState extends State<ReservingPage> {

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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Register ",
                    style: TextStyle(
                      fontSize: 35.0,
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                  Text(
                    "Completed!",
                    style: TextStyle(
                      fontSize: 35.0,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
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
                width: MediaQuery.of(context).size.width / 10 * 8,
                child: Material(
                  color: Color(0xff5772a1),
                  borderRadius: BorderRadius.circular(
                    10.0,
                  ),
                  child: MaterialButton(
                    child: Text(
                      "Back to home",
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
                height: MediaQuery.of(context).size.height / 10 * 2.5,
              )
            ],
          ),
        ],
      ),
    );
  }
}
