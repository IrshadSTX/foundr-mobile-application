import 'package:circle_bottom_navigation_bar/circle_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:foundr_project/controllers/provider/bottom_navigation.dart/bottom_navigation.dart';
import 'package:foundr_project/core/colors.dart';
import 'package:foundr_project/views/main_screens/home_screen/widgets/get_tabs_data.dart';

import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final viewPadding = MediaQuery.of(context).viewPadding;
    double barHeight;
    double barHeightWithNotch = 67;
    double arcHeightWithNotch = 67;

    if (size.height > 700) {
      barHeight = 55;
    } else {
      barHeight = size.height * 0.1;
    }

    if (viewPadding.bottom > 0) {
      barHeightWithNotch = (size.height * 0.05) + viewPadding.bottom;
      arcHeightWithNotch = (size.height * 0.075) + viewPadding.bottom;
    }

    return Consumer<NavigationBarProvider>(
      builder: (context, model, _) {
        return Scaffold(
          body: model.pages[model.currentPage],
          bottomNavigationBar: CircleBottomNavigationBar(
            initialSelection: model.currentPage,
            barHeight: viewPadding.bottom > 0 ? barHeightWithNotch : barHeight,
            arcHeight: viewPadding.bottom > 0 ? arcHeightWithNotch : barHeight,
            itemTextOff: viewPadding.bottom > 0 ? 0 : 0.1,
            itemTextOn: viewPadding.bottom > 0 ? 0 : 0.1,
            circleOutline: 3.0,
            shadowAllowance: 0.2,
            circleSize: 50.0,
            blurShadowRadius: 30.0,
            circleColor: kRose,
            activeIconColor: Colors.white,
            inactiveIconColor: kBrown,
            tabs: getTabsData(),
            onTabChangedListener: (index) => model.setCurrentPage(index),
          ),
        );
      },
    );
  }
}
