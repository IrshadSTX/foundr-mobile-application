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
//drop down lists managment
//

  onChangeGender(String val) {
    if (val == 'Gender') {
      return 'Gender couldnot be null';
    } else {
      drpSelected = val;
      notifyListeners();
    }
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
    UserProfileServices().updateUserService(aboutUser).then(
          (value) => {
            if (value == true)
              {SnackbarPopUps.popUpG('Profile Updated Successfully', context)}
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

  InputDecoration fieldDecor() {
    return InputDecoration(
        hintText: 'Gender',
        contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        filled: true,
        fillColor: Colors.white);
  }

//**************ABOUT ME SECTION**************//

  final accomplishmentController = TextEditingController();
  final educationController = TextEditingController();

  int? isTechnical;
  int? haveIdeaSelected;
  String? onChangehaveIdea(int val) {
    if (val == 0) {
      return 'definiteIdea';
    } else if (val == 1) {
      return 'readyToExplore';
    } else {
      return 'noIdea';
    }
  }

  //responseFounder
  List<String>? responseFounderSelected = [];
  String? respFounder = 'select one';
  var responseFounderitems = [
    'select one',
    'Product',
    'Engineer',
    'Design',
    'Sales and Marketing',
    'Operations'
  ];
  onchangeResponseFounder(String value) {
    if (value == 'select one' || value.isEmpty) {
      return 'select field';
    } else {
      if (responseFounderSelected!.contains(value)) {
        responseFounderSelected!.remove(value);
        notifyListeners();
      } else {
        responseFounderSelected!.add(value);
        notifyListeners();
      }
    }
  }

  //InterestedFounder
  List<String?> interestedSelected = [];
  String? intrstFounder = 'select one';
  var interestedItems = [
    'select one',
    'Agriculture / Agtech',
    'Artificial Intelligence',
    'Augmented Reality / Virtual Reality',
    'B2B / Enterprise',
    'Biomedical / Biotech',
    'Education / Edtech',
    'Entertainment',
    'Government',
    'Health / Wellness',
    'Travel / Tourism'
  ];
  onchangeInterestedFounder(String value) {
    if (value == 'select one' || value.isEmpty) {
      return 'select field';
    } else {
      if (interestedSelected.contains(value)) {
        responseFounderSelected!.remove(value);
        notifyListeners();
      } else {
        interestedSelected.add(value);
        notifyListeners();
      }
    }
  }

  //**************CO-FOUNDER SECTION**************//

  //technical or non technical

  String? techOrNonTechSelected = 'select one';
  var techOrNonTechItems = [
    'select one',
    'Technical',
    'Non-Technical',
    'No Preference'
  ];
  onChangeTechOrNonTech(String val) {
    if (val == 'select one') {
      return 'select field';
    } else {
      techOrNonTechSelected = val;
      notifyListeners();
    }
  }

  //Do have idea
  String? ideaHaveSelected = 'select one';
  var ideaHaveItems = [
    'select one',
    'I Want to see Co-founders who are not set on a specific idea',
    'I Want to see Co-founders who have a specific idea',
    'No Preference'
  ];
  onChangeIdeaHave(String val) {
    if (val == 'select one') {
      return 'select field';
    } else {
      ideaHaveSelected = val;
      notifyListeners();
    }
  }

  //location preference
  String? locationPrefSelected = 'select one';
  var locationPrefItems = [
    'select one',
    'Within a certain distance of me',
    'In my country',
    'No preference'
  ];
  onChangeLocationPref(String val) {
    if (val == 'select one') {
      return 'select field';
    } else {
      locationPrefSelected = val;
      notifyListeners();
    }
  }

  //AREA OF RESPONSIBILITY
  List<String?> areaOfResponsibilitySelected = [];
  String? areaOfResponsibility = 'select one';
  var areaOfResponsibilityitems = [
    'select one',
    'Agriculture / Agtech',
    'Artificial Intelligence',
    'Augmented Reality / Virtual Reality',
    'B2B / Enterprise',
    'Biomedical / Biotech',
    'Education / Edtech',
    'Entertainment',
    'Government',
    'Health / Wellness',
    'Travel / Tourism'
  ];
  onChangeAreaOfResponsibility(String value) {
    if (value == 'select one' || value.isEmpty) {
      return 'select field';
    } else {
      if (areaOfResponsibilitySelected.contains(value)) {
        areaOfResponsibilitySelected.remove(value);
        notifyListeners();
      } else {
        areaOfResponsibilitySelected.add(value);
        notifyListeners();
      }
    }
  }
}
