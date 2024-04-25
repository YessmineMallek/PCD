import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
// import 'package:train_truck/Screens/Search/SearchPage.dart';
import 'package:train_truck/Screens/Maps/DetailRoutes.dart';
import 'package:train_truck/Screens/DetailsScreen.dart';
import 'package:train_truck/Screens/Bottom.dart';
import 'package:train_truck/Screens/Login_Registration/ChoicePage.dart';
import 'package:train_truck/Screens/Login_Registration/SplashScreen.dart';
import 'package:train_truck/Screens/Login_Registration/loginPage.dart';

import 'package:train_truck/Screens/Maps/MapScreen.dart';
import 'package:train_truck/Screens/Search/SearchPage.dart';
import 'package:wifi_iot/wifi_iot.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  void _enableWiFi() async {
    try {
      await WiFiForIoTPlugin.setEnabled(true);
      print('Wi-Fi activé avec succès.');
    } catch (e) {
      print('Erreur lors de l\'activation du Wi-Fi : $e');
    }
  }
  MyApp({super.key});
  final Color _primaryColor = HexColor('#62A39F');

  //final Color _accentColor = HexColor("#3F8CFF");
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
     _enableWiFi();

    return GetMaterialApp(
      theme:ThemeData(
          primaryColor: _primaryColor
      ),
      debugShowCheckedModeBanner: false,
      title: 'Train Truck',
      home: ChoicePage(),
    );
  }
}
