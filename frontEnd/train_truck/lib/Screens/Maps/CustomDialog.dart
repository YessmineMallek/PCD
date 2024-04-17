import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class CustomDialogPage extends StatelessWidget {
   CustomDialogPage({super.key,required this.listStopsTime});
   var listStopsTime;

   var myColor;
   late Size mediaSize;
  @override
  Widget build(BuildContext context) {
    mediaSize = MediaQuery.of(context).size;
    myColor=Theme.of(context).primaryColor;
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
        height: mediaSize.height/1.5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text("L'itinéraire",style: GoogleFonts.alata(color:myColor, fontWeight:FontWeight.w600, fontSize:20)),
            SizedBox(height: 10,),
            Container(
              height:mediaSize.height/1.9 ,
              child: ListView.builder(
                itemCount: listStopsTime.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      _firstLigne(index),
                      _SecondLigne(index),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: SizedBox(
                          height: 1,width: mediaSize.width,child: Container(color: myColor,),
                        ),
                      ),
                    ],
                  );
                }),)
          ],
        ),)
    );
  }
  Widget _firstLigne(index)
  {
    return Row(children: [
      Icon(FontAwesomeIcons.locationDot,size: 15,color: Colors.lightBlue),
      Text(listStopsTime[index].stopId.stopName),


    ],);
  }

   Widget _SecondLigne(index)
   {

     return Row(children: [
       Icon(Icons.access_time,size: 15,color: Colors.lightBlue,),
       (listStopsTime[index].arrivalTime!="00:00:00")?
       Row(children: [ Text(listStopsTime[index].arrivalTime),],):Container(),

       (listStopsTime[index].departureTime!="00:00:00")?
       Row(children: [  Icon(Icons.arrow_right_alt,color: Colors.lightBlue,),Text(listStopsTime[index].departureTime)],):Container(),


     ],);

   }
}
