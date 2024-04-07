import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:train_truck/Screens/Bottom.dart';
import 'package:train_truck/Screens/Providers/HeaderWidget.dart';

class ChoicePage extends StatelessWidget {
  const ChoicePage({super.key});

  @override
  Widget build(BuildContext context) {
    var primaryColor=Theme.of(context).primaryColor;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderWidget(),
            SizedBox(height:100),

            Container(
              height: Get.height/10,
              padding: EdgeInsets.symmetric(vertical: 15,horizontal: 15),
              width: Get.width/1.5,
              decoration:BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: primaryColor.withOpacity(0.2)
              ) ,
              child: Row(
                mainAxisAlignment:MainAxisAlignment.center,
                children: [
                  Text("Grand lignes",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold)),

                  IconButton(onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>  BottomPage()),
                    );

                  }, icon:Icon(Icons.next_plan_rounded,color: primaryColor,size: 40,))
                ],
              ),
            ),
            SizedBox(height:100),
            Container(
              height: Get.height/10,
              padding: EdgeInsets.symmetric(vertical: 15,horizontal: 15),
              width: Get.width/1.5,
              decoration:BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: primaryColor.withOpacity(0.2)
              ) ,
              child: Row(
                mainAxisAlignment:MainAxisAlignment.center,
                children: [
                  Text("Banlieue Sud",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold)),

                  IconButton(onPressed: (){}, icon:Icon(Icons.next_plan_rounded,color: primaryColor,size: 40,))
                ],
              ),
            ),
            SizedBox(height:100),

            Container(
              height: Get.height/10,
              padding: EdgeInsets.all(15),
              width: Get.width/1.5,
              decoration:BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: primaryColor.withOpacity(0.2)
              ) ,
              child: Row(
                mainAxisAlignment:MainAxisAlignment.center,
                children: [
                  Container(

                      child: Text("Sahel",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold))),

                  IconButton(onPressed: (){}, icon:Icon(Icons.next_plan_rounded,color: primaryColor,size: 40,))
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
