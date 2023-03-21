import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


class ProfileScreenProvider with ChangeNotifier {
  
  TextEditingController aboutController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController nationController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController genderController = TextEditingController();

  String? checkingEmpty(String? value) {
    if (value == null || value.isEmpty) {
      Fluttertoast.showToast(msg: "fill the form");
    } else {
      return null;
    }
    return null;
  }

  String? ageValidation(String? value) {
    int? ageCheck = int.tryParse(value!);
    if (ageCheck == null) {
      Fluttertoast.showToast(msg: "age not be null");
    } else if (ageCheck < 0 || ageCheck > 99) {
      return 'Please enter a valid age';
    } else {
      return null;
    }
  }
}
