import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:train_truck/Screens/SplashScreenItems.dart';
import 'package:train_truck/Screens/Login_Registration/loginPage.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final controller = SplashScreenItems();
  final pageController = PageController();
  final height = Get.height;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomSheet: Container(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SmoothPageIndicator(
                controller: pageController,
                count: controller.items.length,
                effect: WormEffect(
                    activeDotColor:Theme.of(context).primaryColor, dotWidth: 30),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>  LoginPage()),
                    );
                  },
                  child: Text(
                    "Commencer",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ))
            ],
          ),
        ),
        body: Stack(
          children: [
            Container(child: Image.asset("assets/images/entete.png")),
            Container(
              padding: EdgeInsets.only(top: height / 15),
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: PageView.builder(
                  itemCount: controller.items.length,
                  controller: pageController,
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(controller.items[index]["image"],
                            width: 260),
                        SizedBox(height: 50),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Text(
                            controller.items[index]["text"],
                            style: TextStyle(color: Colors.black, fontSize: 17),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    );
                  }),
            ),
          ],
        ));
  }
}
