import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:latlong2/latlong.dart';
import 'package:train_truck/Controllers/RouteController.dart';
import 'package:train_truck/Controllers/StopController.dart';
import 'package:train_truck/Screens/Favoris/Favoris_avec_resultat.dart';
import 'package:train_truck/Screens/HorsLigne.dart';
import 'package:train_truck/Screens/Maps/ItineraireCard.dart';
import 'package:train_truck/Screens/Perturbations.dart';

import 'package:train_truck/Models/Arret.dart';



class ItineraireScreen extends StatefulWidget {
  const ItineraireScreen({super.key});

  @override
  State<ItineraireScreen> createState() => _ItineraireScreen();
}

class _ItineraireScreen extends State<ItineraireScreen> {

  StopController stopController = Get.put(StopController());
  RouteController routeController=Get.put(RouteController());

  @override
  Widget build(BuildContext context) {
    stopController.findAllStops();

    return
         Stack(
            children: [

              content(),
              Positioned(
                top: 20,
                child: IconButton(
                    onPressed: (){
                      Navigator.of(context).pop();

                    }, icon: Icon(Icons.arrow_back_outlined,color: Colors.black,)),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 300,

                  child: Card(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        )),
                    elevation: 4,

                    color:  HexColor('#62A39F').withOpacity(0.9),
                    child: Center(
                    child: Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(width: 60.0),
                              IconButton(onPressed: (){
                                Get.to(()=>Favoris_avec_resultat());
                              },
                                  icon: Icon(Icons.star_border,
                                    color: Colors.white,

                                  )
                              ),
                              SizedBox(width: 50.0),
                              IconButton(onPressed: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>  HorsLigne()),
                                );

                              },
                                  icon: Icon(Icons.timer_sharp,
                                    color: Colors.white,)
                              ),
                              SizedBox(width: 50.0),
                              IconButton(onPressed: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>  Perturbations()),
                                );

                              },
                                  icon: Icon(Icons.error_outline,
                                    color: Colors.white,)
                              ),
                            ],
                          ),
                          Container(
                            child:  routeController.routes.isNotEmpty
                                ? Expanded(
                              child: Obx (()=>ListView.builder(
                                itemCount: routeController.routes.value.length,
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      ItineraireCard(route: routeController.routes.value[index], itemIndex: index),
                                      SizedBox(height: 10.0),
                                    ],
                                  );
                                },
                              )),
                            ):
                            Center(
                              child: Text(
                                "Aucune Station trouvée",
                                style: TextStyle(fontSize: 15,color: Colors.black87
                                ),
                              ),
                            ),
                          ),
                        ]
                    ),
                  ),)
              ),
      ),
      ],


    );
  }
  Widget content() {
    return FlutterMap(
      options: MapOptions(
          initialCenter: LatLng( 35.821430, 10.634422),
          initialZoom: 9,
          interactionOptions:
          const InteractionOptions(flags: ~InteractiveFlag.doubleTapZoom)),
          children: [
           openStreetMapTileLater,
           Obx(
              ()=> MarkerLayer(

              markers: [
                for(var item in stopController.stops.value )
                  Marker(
                      point: LatLng(item.stopLat, item.stopLon),
                      width: 40,
                      height: 40,
                      alignment: Alignment.centerLeft,
                      child: Icon(
                        Icons.location_pin,
                        size: 30,
                        color: Colors.red,
                      )),
              ]),
        ),

      ],
    );
  }

  TileLayer get openStreetMapTileLater => TileLayer(
    urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
    userAgentPackageName: 'dev.fleaflet.flutter_map.example',
  );
}
