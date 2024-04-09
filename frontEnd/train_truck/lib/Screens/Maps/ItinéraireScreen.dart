import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:latlong2/latlong.dart';
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

  @override
  Widget build(BuildContext context) {
    return
         Stack(
            children: [
              content(),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 300,
                  decoration: BoxDecoration(
                    color: HexColor('#62A39F').withOpacity(0.9),
                    borderRadius: BorderRadius.circular(10),
                  ),

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
                        SizedBox(height: 8.0),
                        Container(
                          child: arrets.isNotEmpty
                              ? Expanded(
                            child: ListView.builder(
                              itemCount: arrets.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    ItineraireCard(arret: arrets[index], itemIndex: index),
                                    SizedBox(height: 10.0),
                                  ],
                                );
                              },
                            ),
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
                ),
              ),
      ),
      ],


    );
  }
  Widget content() {
    return FlutterMap(
      options: MapOptions(
          initialCenter: LatLng( 35.821430, 10.634422),
          initialZoom: 12,
          interactionOptions:
          const InteractionOptions(flags: ~InteractiveFlag.doubleTapZoom)),
      children: [
        openStreetMapTileLater,
        MarkerLayer(markers:[
          Marker(
              point: LatLng(35.83333 , 10.6333308),
              width: 40,
              height: 40,
              alignment: Alignment.centerLeft,
              child: Icon(
                Icons.location_pin,
                size: 30,
                color: Colors.red,
              )),
        ]),

      ],
    );
  }

  TileLayer get openStreetMapTileLater => TileLayer(
    urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
    userAgentPackageName: 'dev.fleaflet.flutter_map.example',
  );
}
