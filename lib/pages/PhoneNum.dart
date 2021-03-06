import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';

class PhoneNum extends StatefulWidget {
  static const id = 'phone_num';

  @override
  _PhoneNumState createState() => _PhoneNumState();
}

class _PhoneNumState extends State<PhoneNum> {
  String countryCode = 'kr';
  int phoneCode = 82;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        leading: MaterialButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.black,
          ),
        ),
      ),
      body: Align(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 30.0,
            ),
            Text(
              "Enter your phone #",
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
            Container(
              width: MediaQuery.of(context).size.width - 80,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10.0,
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: MaterialButton(
                        padding: EdgeInsets.zero,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 25.0,
                              child: Image.asset(
                                'icons/flags/png/$countryCode.png',
                                package: 'country_icons',
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text('+$phoneCode',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  letterSpacing: -1.0,
                                )),
                          ],
                        ),
                        onPressed: () {
                          showCountryPicker(
                            context: context,
                            showPhoneCode: true,
                            // optional. Shows phone code before the country name.
                            onSelect: (Country country) {
                              setState(() {
                                countryCode = country.countryCode.toLowerCase();
                                phoneCode = int.parse(country.phoneCode);
                              });
                            },
                          );
                        },
                      ),
                    ),
                    Expanded(
                      flex: 8,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          contentPadding: EdgeInsets.only(
                              left: 15, bottom: 11, top: 11, right: 15),
                          hintText: "Phone Number",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 70.0,
              ),
              child: Text(
                "By entering your number, you're agreeing to our Terms of Service and Privacy Policy. Thanks!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  height: 1.8,
                  fontSize: 10.0,
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Align(
              alignment: Alignment.center,
              child: Material(
                color: Colors.grey[400],
                borderRadius: BorderRadius.circular(
                  30.0,
                ),
                child: MaterialButton(
                  minWidth: 0,
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
                  onPressed: () {
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
