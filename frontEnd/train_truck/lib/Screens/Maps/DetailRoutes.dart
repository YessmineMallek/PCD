
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:train_truck/Controllers/RouteController.dart';
import 'package:get/get.dart';
import 'package:train_truck/Screens/Maps/CustomDialog.dart';

class DetailRoutesPage extends StatefulWidget {
  const DetailRoutesPage({super.key});

  @override
  State<DetailRoutesPage> createState() => _DetailRoutesPageState();
}

class _DetailRoutesPageState extends State<DetailRoutesPage> {
    RouteController routeController=Get.put(RouteController());

    var myColor;
    late Size mediaSize;
    bool rememberUser = false;
    var origine;
    var destination;
    var firstBlue=HexColor("#ADDAE8");
    var secondBlue=HexColor("#8DBEE4");
    var grey=HexColor("#4E5773");

    @override
  void initState() {
      print(routeController.routeDetail.value.trip);
      List<String> chainesSeparees = routeController.routeDetail.value.routeLongName!.split("-");
      if (chainesSeparees.length >= 2) {
         origine = chainesSeparees[0];
         destination = chainesSeparees[1];
      }
    // TODO: implement initState
    super.initState();
  }
    @override
    Widget build(BuildContext context) {


      mediaSize = MediaQuery.of(context).size;
      myColor=Theme.of(context).primaryColor;
      return Container(
        decoration: BoxDecoration(
          color: myColor,

        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(children: [
            Positioned(top:0, child: _buildTop()),
            Positioned(bottom: 0, child:_buildBottom()),
          ]),
        ),
      );
    }

    Widget _buildTop (){
      return SizedBox(
        width: mediaSize.width,
        child:  Stack(

          children: [
            Positioned(
              top: 20,
              child: IconButton(
                  onPressed: (){Navigator.of(context).pop();},
                  icon: Icon(Icons.arrow_back_outlined,color: Colors.white,)),
            ),
            Align(alignment: Alignment.topRight, child:  Image.asset("assets/images/train.png",width: 250,))


          ],
        ),
      );
    }
    Widget _buildBottom() {
      return SizedBox(
        width: mediaSize.width,
        height: mediaSize.height/1.35,
        child: Card(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              )),
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child:_buildContent(),
          ),
        ),
      );
    }
    Widget _buildContent()
    {
      return Column(
        children: [
        SizedBox(
            width: mediaSize.width,
            child: Card(
              color: HexColor('#deeceb'),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  )),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    //Icons a gauche
                    Column(
                     children: [
                     Icon(FontAwesomeIcons.locationDot,color: secondBlue,),
                       Padding(
                         padding: EdgeInsets.symmetric(vertical: 10),

                       child: SizedBox(
                           height: 30,width: 1,child:Container(color: grey)),
                     ),
                     Icon(FontAwesomeIcons.locationDot,color: Colors.lightBlue,),],
                   ),


                    SizedBox(width: 20,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("A partir de: ",style:  TextStyle(color:grey,fontSize: 15,fontWeight: FontWeight.w500,),),
                        Text("$origine"),
                       Row(
                            children: [
                              SizedBox(
                                  height: 1,width: mediaSize.width/2.5,child:Container(color: grey)),
                            Container(
                              height: 30,
                              child: IconButton(
                                iconSize: 20,
                                  onPressed: (){
                                var aux=origine;
                                origine=destination;
                                destination=aux;
                                setState(() {
                                });


                              }, icon: Icon(Icons.swipe_vertical_sharp ,color: secondBlue,)),
                            )

                            ],
                          ),

                        Text("Jusqu'à:",style:  TextStyle(color: grey,fontSize: 15,fontWeight: FontWeight.w500),),
                        Text("$destination"),],
                    )
                    

                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 10,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Les voyages disponibles",style: GoogleFonts.alata(color:myColor, fontWeight:FontWeight.w600, fontSize:20

              ),),
              SingleChildScrollView(
                child: Container(
                    height: mediaSize.height/2.9,
                    child: ListView.builder(
                      itemCount: routeController.routeDetail.value.trip!.length,
                      itemBuilder: (context, index) {
                        var item=routeController.routeDetail.value.trip![index]!;
                        return (item.tripHeadsign==destination)? Container(padding: EdgeInsets.symmetric(vertical: 5), child:_buildTripItem(index) ):Container();
                      }

              )

          ))


        ]),

      ]);
    }

    Widget _buildTripItem(index)
    {
      return
        SizedBox(
          width: 10,
          child: Column(
            children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
            children:[
              buildItem(index),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: SizedBox(
                  height: 1,width: mediaSize.width,child: Container(color: myColor,),
                ),
              )
            ],),

            ],
          ),
        );


    }

    Widget buildItem(index)
    {
      return Stack(
        children: [
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                Row(
                children: [
                Icon(Icons.calendar_month,color:Colors.lightBlue),
                SizedBox(width: 10.0),
                Text(routeController.routeDetail.value.trip![index].weekDay!)
              ]),
                SizedBox(height: 10,),
                  Row(
                  children: [
                Icon(FontAwesomeIcons.locationDot,color: Colors.lightBlue,),
                SizedBox(width: 10.0),
                Text(routeController.routeDetail.value.trip![index].tripHeadsign!)
                ])]),
          Positioned(
            right: 0,
              child: ElevatedButton(
                onPressed: (){
                showDialog(
                    context: Get.context!,
                    builder: (BuildContext context) {
                      return CustomDialogPage(listStopsTime:routeController.routeDetail.value.trip![index].stopsTime );
                    });

              }, child: Text("Details",style: TextStyle(color: Colors.lightBlue),),
                style: ElevatedButton.styleFrom(
                backgroundColor: HexColor('#deeceb'),
              ),))
        ],
      );

    }

  }















                         // Text(
                         // "A partir de: ",
                         // style: TextStyle(
                          //  color: grey,
                          //  fontSize: 15,
                          //  fontWeight: FontWeight.w500,
                        //  ),
                       // ),

                        //  validator: (val) {
                         //   if (val == null || val.isEmpty) {
                          //    return "Veuillez saisir votre départ";
                          //  }
                         //   return null;
                        //  },
                      // ),