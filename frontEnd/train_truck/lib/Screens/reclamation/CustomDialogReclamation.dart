import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class CustomDialogReclamation extends StatelessWidget {
  CustomDialogReclamation({super.key,required this.msg});
  var msg;

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
          height: mediaSize.height/3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.railway_alert,size: 50,color: myColor),
              SizedBox(height: 15,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text("Reclamation envoyée",style: GoogleFonts.alata(color:Colors.black, fontWeight:FontWeight.w500, fontSize:20)),
              ],),
             msg=="Accident"? Text("${msg}",style: GoogleFonts.alata(color:Colors.red, fontWeight:FontWeight.w500, fontSize:18)):
             Text("${msg}",style: GoogleFonts.alata(color:Colors.green, fontWeight:FontWeight.w500, fontSize:18)),

              SizedBox(height: 15,),
              IconButton(onPressed: (){
                Navigator.of(context).pop();
              }, icon:Icon(FontAwesomeIcons.circleCheck,size: 30,color: myColor,)),
            ],
          ),)
    );
  }

}