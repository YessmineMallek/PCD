import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:train_truck/Models/Reclamation.dart';
import 'package:train_truck/helpers/Env.dart';

class ReclamationService {

  String baseUrl= "${Env().ipAdresse}/api/v1/reclamation/add";

   submitReclamation(Reclamation reclamation,jwt) async {
    try {
      final http.Response response = await http.post(
        Uri.parse(baseUrl),
        headers: <String, String>{
          'Authorization': 'Bearer ' + jwt,
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(reclamation.toJson()),
      );
        return response;

    } catch (e) {
      print('Error submitting reclamation: $e');
      return null;
    }
  }
}