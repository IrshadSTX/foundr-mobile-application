import 'package:flutter/material.dart';
import 'package:foundr_project/controllers/provider/bottom_navigation.dart/bottom_navigation.dart';
import 'package:foundr_project/controllers/provider/event/event_payment_provider.dart';
import 'package:foundr_project/controllers/provider/otp_provider/otp_provider.dart';

import 'package:foundr_project/controllers/provider/profile/profile_screen_provider.dart';
import 'package:foundr_project/controllers/provider/sign_in_provider/sign_in_provider.dart';
import 'package:foundr_project/controllers/provider/sign_up_provider/sign_up_provider.dart';
import 'package:foundr_project/controllers/provider/splash_provider/splash_provider.dart';
import 'package:foundr_project/core/colors.dart';
import 'package:foundr_project/views/splash_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  MaterialColor createMaterialColor(Color color) {
    List strengths = <double>[.05];
    Map<int, Color> swatch = {};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    for (var strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    return MaterialColor(color.value, swatch);
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => SplashScreenProvider(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => SigninProvider(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => SignUpProvider(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => OtpProvider(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => NavigationBarProvider(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => EventPaymentProvider(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => ProfileScreenProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: createMaterialColor(kBrown),
            fontFamily: GoogleFonts.poppins().fontFamily),
        home: const SplashScreen(),
      ),
    );
  }
}
