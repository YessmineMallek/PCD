import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(child:
      Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
                padding: EdgeInsets.only(top:100),
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Notifications",style: TextStyle(
                        color: Theme.of(context).primaryColor,fontWeight: FontWeight.w400,
                        fontFamily: 'Oxygen',fontSize: 20)),
                    Container(
                      color: Theme.of(context).primaryColor,
                      width: (width) /1.8,
                      height: 2,
                    ),
                  ],)),
            SizedBox(height: 100,),
            Container(child: Text("hey"),)
          ],
        ),
      ),),
    );
  }
}
