import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:train_truck/Screens/Bottom.dart';
import 'package:train_truck/Screens/Login_Registration/ChoicePage.dart';
import 'package:train_truck/Screens/Login_Registration/SplashScreen.dart';

import 'package:train_truck/Screens/Maps/MapScreen.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final Color _primaryColor = HexColor('#62A39F');

  //final Color _accentColor = HexColor("#3F8CFF");
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme:ThemeData(
          primaryColor: _primaryColor
      ),
      debugShowCheckedModeBanner: false,
      title: 'Train Truck',
      home: SplashScreen(),
    );
  }
}
