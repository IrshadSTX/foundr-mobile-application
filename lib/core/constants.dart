import 'package:flutter/material.dart';
import 'package:foundr_project/core/widgets/textstyle.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

//width
SizedBox kWidth10 = const SizedBox(
  width: 10,
);
SizedBox kWidth20 = const SizedBox(
  width: 20,
);
//heights
SizedBox kHeight5 = const SizedBox(
  height: 5,
);
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
Divider divider = const Divider(
  thickness: 2,
);
//textstyle

TextStyle kHeading = GoogleFonts.poppins(
  color: kBrown,
  fontSize: 24,
  fontWeight: FontWeight.bold,
);

Widget textHeading(String text) {
  return TextStyleWidget(
    title: text,
    thick: FontWeight.bold,
    textcolor: kBrown,
    fontsize: 24,
  );
}

Widget textMiniHeading(String text) {
  return TextStyleWidget(
    title: text,
    thick: FontWeight.bold,
    textcolor: kBrown,
    fontsize: 18,
  );
}

Widget textParagraph(String text) {
  return TextStyleWidget(
    title: text,
    thick: FontWeight.w500,
    textcolor: kGreen,
    fontsize: 12,
  );
}

Widget textParagraphBlack(String text) {
  return TextStyleWidget(
    title: text,
    thick: FontWeight.w400,
    textcolor: Colors.black,
    fontsize: 12,
  );
}

Row questionAir(String number, String question) {
  return Row(
    children: [
      textMiniHeading(number),
      kWidth10,
      Expanded(child: textParagraphBlack(question))
    ],
  );
}

const textstyle =
    TextStyle(color: kBrown, fontSize: 16, fontWeight: FontWeight.w400);
const textstyle2 =
    TextStyle(color: kBrown, fontSize: 13, fontWeight: FontWeight.w400);
//snackbars
const snackBar = SnackBar(content: Text('Invalid Email or Password'));
const emailExists = SnackBar(content: Text('Email Already Exists'));
const oTPvarified = SnackBar(content: Text('OTP varified'));
const sWWrong = SnackBar(content: Text('Something went wrong!'));
const incorrectOTP = SnackBar(content: Text('INCORRECT OTP'));
const dataFailsMsg = SnackBar(content: Text('Could not Retrieve data'));
