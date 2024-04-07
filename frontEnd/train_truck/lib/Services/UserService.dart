import 'dart:convert';

import 'package:train_truck/Models/User.dart';
import 'package:train_truck/helpers/Env.dart';
import 'package:http/http.dart' as http;

class UserService {

  createUser(User userToCreate) async {
    String baseUrl = "${Env().ipAdresse}/api/v1/auth/register";
    try {
      final res = await http.post(Uri.parse(baseUrl),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode({
            "firstName": userToCreate.firstName,
            "lastName": userToCreate.lastName,
            "password_user": userToCreate.passwordUser,
            "phoneNumber": int.parse(userToCreate.phoneNumber!)
          }));
      print("..............................................${res.statusCode}");
      return res;
    } catch (e) {
      print("UserService: error creating user $e");
    }
  }

  authenticate(User userToCreate) async {
    String baseUrl = "${Env().ipAdresse}/api/v1/auth/authenticate";
    try {
        final res = await http.post(Uri.parse(baseUrl),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode({
              "password_user": userToCreate.passwordUser,
              "phoneNumber": int.parse(userToCreate.phoneNumber!)
            }));
        return res;
    } catch (e) {
      print("UserService: error authenticate $e");
    }
  }
}