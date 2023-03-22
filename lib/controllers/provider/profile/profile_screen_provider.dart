import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:foundr_project/model/api/profile/profile_user_model.dart';
import 'package:foundr_project/model/api/profile/update_profile_model.dart';
import 'package:foundr_project/services/profile/profile_services.dart';
import 'package:foundr_project/views/widgets/snackbar_widget.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreenProvider with ChangeNotifier {
  File? file;
  UserDetails? profileDatas;

  TextEditingController aboutController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController nationController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  var dropBoxItems = ['Gender', 'Male', 'Female', 'Other'];
  String drpSelected = 'Gender';
  //
  //getting user details
  //
  Future<void> getUserDetailsProvider() async {
    UserProfileServices().getUserDetails().then(
          (value) => {
            profileDatas = value,
            notifyListeners(),
          },
        );
  }

//
//to update profile
//
  Future pickImage(BuildContext context) async {
    log('pick image function entered');
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile == null) return;
    final tempImage = File(pickedFile.path);

    String format = pickedFile.path.split('.').last == 'png' ? 'png' : 'jpeg';
    final base64file = base64Encode(tempImage.readAsBytesSync());
    String base64Image = 'data:image/$format;base64,$base64file';
    notifyListeners();
    UserProfileServices().profileUpdate(base64Image).then(
          (value) => {
            if (value = true)
              {
                SnackbarPopUps.popUpG('profile updated Successfully', context),
                getUserDetailsProvider()
              }
            else if (value == false)
              {SnackbarPopUps.popUpB('Invalid user', context)}
          },
        );
  }

//
//to update about user
//
  Future<void> updateAboutProvider(BuildContext context) async {
    final about = aboutController.text;
    final gender = drpSelected;
    final age = ageController.text.trim();
    final nation = nationController.text.trim();
    final city = cityController.text.trim();
    final state = stateController.text.trim();
    final aboutUser = UpdateUseraboutModel(
      nation: nation,
      age: age,
      state: state,
      city: city,
      intro: about,
      gender: gender,
    );
    UserProfileServices().updateAboutService(aboutUser).then(
          (value) => {
            if (value == true)
              {SnackbarPopUps.popUpB('Profile Updated Successfully', context)}
            else if (value == false)
              {SnackbarPopUps.popUpB('Invalid user', context)}
          },
        );
  }

//
//validation section
//
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
    }
    return null;
  }
}
