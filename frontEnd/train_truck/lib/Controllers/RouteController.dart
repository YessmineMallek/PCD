import 'dart:convert';

import 'package:get/get.dart';
import 'package:train_truck/Models/Route.dart';
import 'package:train_truck/Services/RouteService.dart';
import 'package:train_truck/Services/UserService.dart';

class RouteController extends GetxController{
  RouteService routeService =RouteService();
  RxList routes=[].obs;
  var isLoading=false.obs;
  var routeDetail=Route().obs;


  var routesCustom=Route().obs;


  findRoutesByAgency(id)async
  {
    isLoading.value=true;

    final token = await UserService.getToken();
    routes.value=[];

    var response=await routeService.getRoutesByAgency(token, id);
    if (response.statusCode == 200) {
      var listRoutes = jsonDecode(response.body);
      print(listRoutes);
      for (var route in listRoutes) {
        routes.add(Route.fromJson(route));
      }
      isLoading.value=false;

    }
  }


  findRoutesByDepArr(origine,destination)async
  {
    isLoading.value=false;

    final token = await UserService.getToken();
    routesCustom=Route().obs;
    var response=await routeService.getRoutesByDestArr(token,origine,destination );
    print("------------------------------------");
    if (response.statusCode == 200) {
      isLoading.value=true;
      print(response.body);
      var listRoutes = jsonDecode(response.body);
      routesCustom.value=Route.fromJson(listRoutes) ;
    }
  }


}