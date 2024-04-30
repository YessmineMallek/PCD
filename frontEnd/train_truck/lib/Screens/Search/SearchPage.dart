
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:train_truck/Controllers/RouteController.dart';
import 'package:get/get.dart';
import 'package:train_truck/Screens/Maps/CustomDialog.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _destinationTEC = TextEditingController();
  TextEditingController _originTEC = TextEditingController();
  var routeController=Get.put(RouteController());

  var myColor;
  var origine;
  var destination;
  late Size mediaSize;
  bool rememberUser = false;
  var firstBlue=HexColor("#ADDAE8");
  var secondBlue=HexColor("#8DBEE4");
  var grey=HexColor("#4E5773");

  @override
  void initState() {
    print(routeController.routesCustom.value.trip);

  }
  @override
  Widget build(BuildContext context) {
    routeController.isLoading.value=false;

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
      height: mediaSize.height/1.7,
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

  Widget _buildContent() {
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
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Icon(FontAwesomeIcons.locationDot, color: secondBlue),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 5),
                            child: SizedBox(
                              height: 40,
                              width: 1,
                              child: Container(color: grey),
                            ),
                          ),
                          Icon(FontAwesomeIcons.locationDot, color: Colors.lightBlue),
                        ],
                      ),
                      SizedBox(width: 1),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "A partir de: ",
                            style: TextStyle(
                                color: grey,
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          ),
                          Container(
                            width: 100,
                            height: 30,
                            child: TextFormField(
                              controller: _originTEC,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Départ',
                                hintStyle: TextStyle(
                                    color: Colors.grey[400], fontSize: 13),
                              ),
                              validator: (val){
                                if(val!.isEmpty){
                                  return "Veuillez saisir votre départ";
                                }
                              },
                                onSaved: (newValue) {

                                }
                            ),
                          ),
                          SizedBox(height: 10,),

                          Row(
                            children: [
                              SizedBox(
                                  height: 1,
                                  width: mediaSize.width / 2.4,
                                  child: Container(color: grey)),
                            ],
                          ),
                          SizedBox(height: 15,),
                          Text(
                            "Jusqu'à:",
                            style: TextStyle(
                                color: grey,
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          ),
                          Container(
                            width: 100,
                            height: 30,
                            child: TextFormField(
                              controller: _destinationTEC,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Destination',
                                hintStyle: TextStyle(
                                    color: Colors.grey[400], fontSize: 13),
                              ),
                              validator: (val){
                                if(val!.isEmpty){
                                  return "Veuillez saisir votre destination";
                                }
                              },
                                onSaved: (newValue) {

                                }

                            ),
                          ),

                        ],
                      ),
                      IconButton(onPressed: ()async{
                        var origine = _originTEC.text;
                        var destination = _destinationTEC.text;
                        await routeController.findRoutesByDepArr(origine,destination);
                      }, icon: Icon(Icons.search))
                    ],
                  ),

                ],

              ),

            ),
          ),
        ),




        SizedBox(height: 10),
     Obx(()=>  routeController.isLoading.value == true ? Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Les voyages disponibles :",style:GoogleFonts.alata(color:myColor, fontWeight:FontWeight.w600, fontSize:18),
            ),
            SingleChildScrollView(
              child:Container(
                height: mediaSize.height/6,
                child: ListView.builder(
                itemCount: (routeController.routesCustom.value.trip!=null)?routeController.routesCustom.value.trip!.length:0,
                itemBuilder: (context, index) {
                  return Container(padding: EdgeInsets.symmetric(vertical: 5), child:_buildTripItem(index) );
                }

                )

                ))


            ],
     ):Container()),
      ],
    );
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
                    Text(routeController.routesCustom.value.trip![index].weekDay!)
                  ]),
              SizedBox(height: 10,),
              Row(
                  children: [
                    Icon(FontAwesomeIcons.locationDot,color: Colors.lightBlue,),
                    SizedBox(width: 10.0),
                    Text(routeController.routesCustom.value.trip![index].tripHeadsign!)
                  ])]),
        Positioned(
             right: 0,
             child: ElevatedButton(
               onPressed: (){
                 showDialog(
                     context: Get.context!,
                    builder: (BuildContext context) {
                    return CustomDialogPage(listStopsTime:routeController.routesCustom.value.trip![index].stopsTime );
                     });

               }, child: Text("Details",style: TextStyle(color: Colors.lightBlue),),
              style: ElevatedButton.styleFrom(
                 backgroundColor: HexColor('#deeceb'),
               ),))
      ],
    );

  }

}






