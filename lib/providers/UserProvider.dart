import 'package:flutter/material.dart';

class User extends ChangeNotifier {
  String fname = 'name';
  String lname = 'name';
  String nickname = '@Anonymous';
  int phoneCode = 82;
  String phoneNum = '01026273086';

  setPhoneCode(_phoneCode) {
    phoneCode = _phoneCode;
  }

  setPhoneNum(_phoneNum) {
    phoneNum = _phoneNum;
  }

  setFName(_fname) {
    fname = _fname;
  }
  setLName(_lname) {
    lname = _lname;
  }

  setNickname(_nickname) {
    nickname = _nickname;
  }
}