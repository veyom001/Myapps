

import 'package:flutter/material.dart';

import 'models/size_config.dart';

final headingStyle=TextStyle(

  fontSize:getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  color : Colors.black,
  height: 1.5,


);
const kPrimaryColor=Color(0xFF6F35A5);
const kPrimaryLightColor=Color(0xFFF1EFF);

final RegExp emailValidatorRegExp =
RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";