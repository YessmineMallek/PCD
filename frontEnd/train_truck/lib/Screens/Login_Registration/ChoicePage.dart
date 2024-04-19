import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:train_truck/Controllers/RouteController.dart';
import 'package:train_truck/Screens/Bottom.dart';
import 'package:train_truck/Screens/Login_Registration/glowing_buttons.dart';
import 'package:train_truck/Screens/Maps/Itin%C3%A9raireScreen.dart';
import 'package:train_truck/Screens/Maps/MapScreen.dart';
import 'package:train_truck/Screens/Providers/HeaderWidget.dart';
import 'package:train_truck/Services/UserService.dart';

class ChoicePage extends StatelessWidget {
   ChoicePage({super.key});
  RouteController routeController=Get.put(RouteController());

  @override
  Widget build(BuildContext context) {
    var primaryColor=Theme.of(context).primaryColor;
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    var value=0;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderWidget(),
            SizedBox(height:100),

            InkWell(
              onTap: ()=>{value=3},
              child: GlowingButton(
                text: "Grand lignes",
              ),
            ),
            SizedBox(height:30),
            InkWell(
              onTap: ()=>{value=2},
              child: GlowingButton(
                text: "Banlieue Sud",
              ),
            ),
            SizedBox(height:30),
            InkWell(
              onTap: ()=>{value=1},
              child: GlowingButton(
                text: "Sahel",
              ),
            ),
            SizedBox(height:30),

            IconButton(
              alignment: Alignment.topRight,
                onPressed: ()async {
                  if(value!=0)
                    {
                      await routeController.findRoutesByAgency(value);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>  BottomPage()),
                      );

                    }else{
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content:  Text("Choisir l'agence"),),
                    );
                  }

                },
                icon: Icon(Icons.skip_next_rounded,size: 40,)),
          ],
        ),

      ) ,
    );
  }
}
