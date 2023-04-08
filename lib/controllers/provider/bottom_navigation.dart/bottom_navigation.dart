import 'package:flutter/material.dart';
import 'package:foundr_project/views/main_screens/article_screen/article_screen.dart';
import 'package:foundr_project/views/main_screens/event_screen/event_screen.dart';
import 'package:foundr_project/views/main_screens/message_screen/messages_screen.dart';
import 'package:foundr_project/views/main_screens/profile_screen/profile_screen.dart';

import '../../../views/main_screens/first_screen/first_screen.dart';

class NavigationBarProvider extends ChangeNotifier {
  int currentPage = 0;
  int? index;
  final List<Widget> _pages = [
    const FirstScreen(),
    const ArticleScreen(),
    const EventScreen(),
    const MessageScreen(),
    ProfieScreen(),
  ];

  List<Widget> get pages => _pages;

  void setCurrentPage(int index) {
    currentPage = index;
    notifyListeners();
  }
}
