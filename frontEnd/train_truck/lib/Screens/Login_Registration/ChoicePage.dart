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
          Text(
            'Choisir votre agence ',
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                color: Colors.grey[800],
                fontWeight: FontWeight.w900,
                fontFamily: 'Open Sans',
                fontSize: 30),
          ),
            SizedBox(height:10),


            Text(
              'Choisissez l\'agence qui vous représente',
              style: TextStyle(
                color: Colors.grey[400],
                fontWeight: FontWeight.w900,
                fontFamily: 'Open Sans',
                fontSize: 10,
              ),
            ),
            SizedBox(height:40),

            Text(
              'Choisissez l\'agence qui vous représente',
              style: TextStyle(
                color: Colors.grey[400],
                fontWeight: FontWeight.w900,
                fontFamily: 'Open Sans',
                fontSize: 10,
              ),
            ),
            SizedBox(height:40),

            InkWell(
                onTap: (){
                  routeController.agencyId.value=3;
                },
                child: GlowingButton(text: "Grand lignes",)),

            SizedBox(height:30),
            InkWell(
                onTap: (){
                  routeController.agencyId.value=2;
                },
                child: GlowingButton(text: "Banlieue Sud",)),

            SizedBox(height:30),
             InkWell(
               child: GlowingButton(text: "Sahel"),
               onTap: (){
               routeController.agencyId.value=1;
             },),

            SizedBox(height:30),

            Container(
              decoration: BoxDecoration(
                color: Colors.grey[400],
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: TextButton.icon(
                onPressed: () async {
                  if(routeController.agencyId.value!=0)
                    {
                        await routeController.findRoutesByAgency();
                       Get.to(()=>BottomPage());
                    }else
                    {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Selectionnez votre agence"),

                          ));
                    }


            Container(
              decoration: BoxDecoration(
                color: Colors.grey[400],
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: TextButton.icon(
                onPressed: () async {
                  await routeController.findRoutesByAgency(3);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BottomPage()),
                  );
                },
                icon: Icon(Icons.skip_next_rounded, color: Colors.black), // Remplacer l'icône par la vôtre si nécessaire
                label: Text(
                  'Suivant',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

          ],
        ),

      ) ,
    );
  }
}
