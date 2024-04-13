import 'package:train_truck/helpers/Env.dart';
import 'package:http/http.dart' as http;

class StopService {
  /***********GetStops************* */
  getStops(jwt) async {
    String baseUrl = "${Env().ipAdresse}/api/v1/stops";
    try {
      final res = await http.get(
        Uri.parse(baseUrl),
        headers: <String, String>{
          'Authorization': 'Bearer ' + jwt,
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      print(res);
      return res;
    } catch (e) {
      print("StopService: error getting Stops $e");
    }
  }
}
