import 'dart:convert';
import 'dart:io';
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
  addReclamation(Reclamation data,jwt,File image,atributeName)async
  {

    http.MultipartRequest request = new http.MultipartRequest('POST', Uri.parse(baseUrl));

    request.fields["user"] = data.phoneNumber!.phoneNumber!;
    request.fields["route"] = data.route!.routeLongName!;
    request.fields["emotion"] = data.emotion!;
    request.fields["description"] = data.description!;
    jsonEncode(request.fields["data"]);

    request.headers['Content-Type'] = 'multipart/form-data';
    if (jwt != "") {
      request.headers['Authorization'] = "Bearer ${jwt.toString()} ";
    }
    var multipartFile = await http.MultipartFile.fromPath(
        "file" + atributeName, image.path);


    request.files.add(multipartFile);

    http.StreamedResponse streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);
    print(response.statusCode);
    return response;

  }
}