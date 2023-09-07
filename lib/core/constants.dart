import 'package:flutter/material.dart';
import 'package:foundr_project/core/widgets/textstyle.dart';
import 'package:foundr_project/views/main_screens/notification/notification_screen.dart';
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

Widget textMiniHeading2(String text) {
  return TextStyleWidget(
    title: text,
    thick: FontWeight.w600,
    textcolor: kBrown,
    fontsize: 15,
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

const userIcon = NetworkImage(
    'data:image/png;base64,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');
const textstyle =
    TextStyle(color: kBrown, fontSize: 16, fontWeight: FontWeight.w400);
const textstyle2 =
    TextStyle(color: kBrown, fontSize: 13, fontWeight: FontWeight.w400);
//snackbars
const snackBar = SnackBar(content: Text('Invalid Email or Password'));
const emailExists = SnackBar(content: Text('Email Already Exists'));
const oTPvarified = SnackBar(content: Text('OTP verified'));
const sWWrong = SnackBar(content: Text('Something went wrong!'));
const incorrectOTP = SnackBar(content: Text('INCORRECT OTP'));
const dataFailsMsg = SnackBar(content: Text('Could not Retrieve data'));

//methods

Row rowBottomSheetAnswers(String left, String right) {
  return Row(
    children: [
      Expanded(
        flex: 2,
        child: textMiniHeading2(left),
      ),
      Expanded(
        flex: 3,
        child: Container(
          decoration: BoxDecoration(
              color: kRoseCream, borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(right),
          ),
        ),
      )
    ],
  );
}

IconButton notificationBtnIcon(BuildContext context) {
  return IconButton(
    onPressed: () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NotificationScreen(),
          ));
    },
    icon: const Icon(
      Icons.notifications,
      size: 30,
    ),
  );
}

connectButtons(
    {double? height1,
    double? width1,
    Color? color,
    text,
    void Function()? onPress,
    IconData? icons}) {
  return SizedBox(
    width: width1,
    // color: Colors.blueAccent,
    height: height1,
    child: ElevatedButton.icon(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          color,
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        ),
      ),
      onPressed: onPress,
      icon: Icon(icons),
      label: Text(text),
    ),
  );
}
