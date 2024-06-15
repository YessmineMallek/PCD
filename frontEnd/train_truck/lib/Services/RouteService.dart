import 'dart:convert';

import 'package:train_truck/Models/Reclamation.dart';
import 'package:train_truck/helpers/Env.dart';
import 'package:http/http.dart' as http;

class RouteService
{
  getRoutesByAgency(jwt,idAgency)async
  {
    String baseUrl = "${Env().ipAdresse}/api/v1/routes/agence/${idAgency}";
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



  getRoutesByDestArr(jwt,dest,arrive)async
  {
    String baseUrl = "${Env().ipAdresse}/api/v1/routes/${dest}/${arrive}";
    try
    {
      final res = await http.get(
        Uri.parse(baseUrl),
        headers: <String, String>{
          'Authorization': 'Bearer ' + jwt,
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      print("----------------"+res.statusCode.toString());
      return res;
    } catch (e) {
      print("RouteService: error getting agency $e");
    }

  }

  updateRoute(jwt,longName,status)async
  {
    String baseUrl = "${Env().ipAdresse}/api/v1/routes/update/${longName}/${status}";
    try
    {
      final res = await http.post(
        Uri.parse(baseUrl),
        headers: <String, String>{
          'Authorization': 'Bearer ' + jwt.toString(),
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      print("----------------"+res.body.toString());

      print("----------------"+res.statusCode.toString());
      return res;
    } catch (e) {
      print("RouteService: error update route $e");
    }

  }
    }
}