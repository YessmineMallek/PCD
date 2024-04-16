import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:latlong2/latlong.dart';
import 'package:train_truck/Controllers/StopController.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  StopController stopController = Get.put(StopController());

  @override
  Widget build(BuildContext context) {
    stopController.findAllStops();

    return  Scaffold(
        appBar: AppBar(

          backgroundColor:  HexColor('#62A39F'),
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios_new_sharp,
                color:Colors.black,
                size: 30.0,
              )),
        ),
        body: content(),
      );

  }

  Widget content() {
    return FlutterMap(
      options: MapOptions(
          initialCenter: LatLng(35.821430, 10.634422),
          initialZoom: 12,
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
