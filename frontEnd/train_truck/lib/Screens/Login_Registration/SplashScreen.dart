
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lottie/lottie.dart';
import 'package:train_truck/Screens/Login_Registration/loginPage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {



    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.height;
    var  myColor=Theme?.of(context).primaryColor;
    return Scaffold(
      body:Stack(

        alignment: Alignment.center,
        children: [
          Positioned(
              top: height/8,
              child: SizedBox(
                width: width/2,
                height: height/2,
                child: Lottie.network(
                    'https://lottie.host/85392769-725e-4674-8e96-f738a038fa53/zvwovCYv3G.json'),
              )),

          Positioned(
              bottom: 0,
              child: SizedBox(
                height: height/2,
                child: Lottie.network(
                    'https://lottie.host/0be3b5ed-0cc8-4184-b92a-1f680bde41ce/nQSWTp95kW.json'),
              )),
          Positioned(
              bottom: 0,
              left: 200,
              child: SizedBox(
                  width: width/3,
                  child: IconButton(
                    onPressed: (){
                      Get.to(
                        LoginPage()
                      );

                    },
                    icon: Icon(Icons.arrow_circle_right_outlined,size: 50,),
                  )
              )),

        ],
      ) ,
    );
  }
}



