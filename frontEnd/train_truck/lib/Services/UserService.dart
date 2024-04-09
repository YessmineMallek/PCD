import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:train_truck/Models/User.dart';
import 'package:train_truck/helpers/Env.dart';
import 'package:http/http.dart' as http;

class UserService {
  static const _key = 'jwtToken';

  // Save JWT token to SharedPreferences
  static Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, token);
  }

  // Retrieve JWT token from SharedPreferences
  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_key);
  }

  // Clear JWT token from SharedPreferences
  static Future<void> clearToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_key);
  }



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
