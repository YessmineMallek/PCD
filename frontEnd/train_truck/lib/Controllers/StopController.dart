import 'dart:convert';

import 'package:get/get.dart';
import 'package:train_truck/Models/Stop.dart';
import 'package:train_truck/Services/StopService.dart';
import 'package:train_truck/Services/UserService.dart';
import 'package:train_truck/main.dart';

class StopController extends GetxController {
  StopService stopService = StopService();
  RxList stops = [].obs;


  findAllStops() async {
    stops=[].obs;
    final token = await UserService.getToken();

    var response = await stopService.getStops(token);
    if (response.statusCode == 200) {
      var listStops = jsonDecode(response.body);
      print("--------------"+listStops.length.toString());
      for (var stop in listStops) {
        stops.add(Stop.fromJson(stop));
      }
    }
  }
}
