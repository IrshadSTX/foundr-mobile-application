import 'package:circle_bottom_navigation_bar/widgets/tab_data.dart';
import 'package:flutter/material.dart';

List<TabData> getTabsData() {
  return [
    TabData(
      icon: Icons.home,
      iconSize: 27,
      fontSize: 10,
      fontWeight: FontWeight.bold,
    ),
    TabData(
      icon: Icons.article,
      iconSize: 27,
      fontSize: 10,
      fontWeight: FontWeight.bold,
    ),
    TabData(
      icon: Icons.event,
      iconSize: 27,
      fontSize: 10,
      fontWeight: FontWeight.bold,
    ),
    TabData(
      icon: Icons.person_2_outlined,
      iconSize: 27,
      fontSize: 10,
      fontWeight: FontWeight.bold,
    ),
  ];
}
