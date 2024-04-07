import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:train_truck/Screens/Itin%C3%A9raireScreen.dart';
import 'package:train_truck/Screens/SplashScreen.dart';
import 'package:train_truck/Screens/loginPage.dart';

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
    return MaterialApp(
      theme:ThemeData(
        primaryColor: _primaryColor
      ),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: ItineraireScreen(),
    );
  }
}
