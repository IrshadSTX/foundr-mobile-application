import 'package:flutter/material.dart';

class ViewProfileProvider with ChangeNotifier {
  bool clickedConnect = false;
  void onClickedConnect() {
    clickedConnect = !clickedConnect;
    notifyListeners();
  }
}
