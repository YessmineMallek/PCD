import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:train_truck/Controllers/RouteController.dart';
import 'package:train_truck/Screens/DetailsScreen.dart';
import 'package:train_truck/Screens/Maps/DetailRoutes.dart';
class ItineraireCard extends StatelessWidget {
   ItineraireCard({
    Key? key,
    required this.itemIndex,
    required this.route,
  }) : super(key: key);

  final  itemIndex;
  final  route;
   RouteController routeController=Get.put(RouteController());

   @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        routeController.routeDetail.value=route;
        print(route);
        Get.to(
          DetailRoutesPage()
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        width: 370,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          child: Text(
            route.routeLongName,
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
            ),

          ),
        ),
      ),
    );
  }
}
