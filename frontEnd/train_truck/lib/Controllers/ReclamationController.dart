import 'dart:convert';
import 'package:get/get.dart';
import 'package:train_truck/Controllers/RouteController.dart';
import 'package:train_truck/Models/Reclamation.dart';
import 'package:train_truck/Models/User.dart';
import 'package:train_truck/Services/ReclamationService.dart';
import 'package:train_truck/Services/UserService.dart';


class ReclamationController extends GetxController {
  ReclamationService recService = ReclamationService();
  RouteController routeController=Get.put(RouteController());
  var reclamation=Reclamation().obs;
  var isLoading=false.obs;
  final List<Reclamation> reclamations = <Reclamation>[].obs;

  void addReclamation(Reclamation reclamation) {
    reclamations.add(reclamation);
  }

  static Future<String> registration(String jsonData) async {
    await Future.delayed(Duration(seconds: 2));
    return "Success";
  }

  Future createReclamation()async
  {
    final token = await UserService.getToken();
    var phone=await UserService.getPhoneNumber();
    isLoading.value=true;
    print(phone);
    User user=User();
    user.phoneNumber=phone;
    reclamation.value.phoneNumber=user;

    var res=await recService.addReclamation(reclamation.value,token);

    if(res != "error")
    {
      routeController.routes.value=[];
      routeController.findRoutesByAgency();
      isLoading.value=false;
      return res;
    }
    else
    {
      return "Echec";
    }

  }







  String toJsonString() {
    final List<Map<String, dynamic>> reclamationJsonList = reclamations.map((reclamation) => reclamation.toJson()).toList();
    return jsonEncode(reclamationJsonList);
  }
}
