import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
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
    stopController.findAllStops(
        "eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiI1MDQzMjM1MSIsImlhdCI6MTcxMjYwNDI0NCwiZXhwIjoxNzEyNjA1Njg0fQ.GPmyf-TFObBjn_BoyhNtTdUNSwxkkWQlP3kRRyBn5DI");
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white60,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios_new_sharp,
                color: HexColor('#62A39F'),
                size: 30.0,
              )),
        ),
        body: content(),
      ),
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
        MarkerLayer(markers: [
          Marker(
              point: LatLng(35.83333, 10.6333308),
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
