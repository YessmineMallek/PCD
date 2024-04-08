import 'package:get/get.dart';
import 'package:train_truck/Models/Stop.dart';
import 'package:train_truck/Services/StopService.dart';

class StopController extends GetxController {
  StopService stopService = StopService();

  Future findAllStops(jwt) async {
    Future<dynamic> stops = stopService.getStops(jwt);
    print(stops);
  }
}
