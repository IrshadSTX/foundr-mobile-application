import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

//heights
SizedBox kHeight10 = const SizedBox(
  height: 10,
);
SizedBox kHeight20 = const SizedBox(
  height: 20,
);
SizedBox kHeight50 = const SizedBox(
  height: 50,
);
SizedBox kHeight30 = const SizedBox(
  height: 30,
);
SizedBox kHeight40 = const SizedBox(
  height: 40,
);
//textstyle

TextStyle kHeading = GoogleFonts.poppins(
  color: kBrown,
  fontSize: 24,
  fontWeight: FontWeight.bold,
);
//snackbars
const snackBar = SnackBar(content: Text('Invalid Email or Password'));
const emailExists = SnackBar(content: Text('Email Already Exists'));
const oTPvarified = SnackBar(content: Text('OTP varified'));
const sWWrong = SnackBar(content: Text('Something went wrong!'));
const incorrectOTP = SnackBar(content: Text('INCORRECT OTP'));
