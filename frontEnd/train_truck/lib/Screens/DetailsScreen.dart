import 'package:flutter/material.dart';
import 'package:train_truck/Models/Arret.dart';
import 'package:train_truck/Models/Arret.dart';



class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key,
    required this.arret,}) : super(key: key);

  @override

  final Arret arret;
  Widget build(BuildContext context) {
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
                    Text(arret.title,style: TextStyle(
                        color: Theme.of(context).primaryColor,fontWeight: FontWeight.w400,
                        fontFamily: 'Oxygen',fontSize: 20)),

                  ],)),
            SizedBox(height: 100,),

          ],
        ),
      ),),
    );
  }
}
