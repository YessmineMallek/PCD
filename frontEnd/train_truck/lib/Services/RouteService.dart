import 'package:train_truck/helpers/Env.dart';
import 'package:http/http.dart' as http;

class RouteService
{
    getRoutesByAgency(jwt,idAgency)async
    {
      String baseUrl = "${Env().ipAdresse}/api/v1/routes/${idAgency}";
      try
      {
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
        print("RouteService: error getting agency $e");
      }

    }


}