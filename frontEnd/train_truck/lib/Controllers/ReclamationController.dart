import 'dart:convert';
import 'package:get/get.dart';
import 'package:train_truck/Models/Reclamation.dart';
import 'package:train_truck/Models/User.dart';
import 'package:train_truck/Services/ReclamationService.dart';
import 'package:train_truck/Services/UserService.dart';


class ReclamationController extends GetxController {
  ReclamationService recService = ReclamationService();
  var reclamation=Reclamation().obs;

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
    print(reclamation.value);
    final token = await UserService.getToken();

    var phone=await UserService.getPhoneNumber();

    var res=await recService.submitReclamation(reclamation.value,token);
    print(res.body);
    if(res.statusCode == 200)
    {
      return "Success";
    }else
    {
      return "Echec";
    }

  }







  String toJsonString() {
    final List<Map<String, dynamic>> reclamationJsonList = reclamations.map((reclamation) => reclamation.toJson()).toList();
    return jsonEncode(reclamationJsonList);
  }
}
