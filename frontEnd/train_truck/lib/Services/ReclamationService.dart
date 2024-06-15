import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:train_truck/Models/Reclamation.dart';
import 'package:train_truck/Services/RouteService.dart';
import 'package:train_truck/helpers/Env.dart';

class ReclamationService {

  String baseUrl= "${Env().ipAdresse}/api/v1/reclamation/add";
  String predictUrl= "${Env().ipAdresseModel}/predict";
  RouteService routeService =RouteService();

  addReclamation(Reclamation data,jwt)async
  {

    http.MultipartRequest request = new http.MultipartRequest('POST', Uri.parse(baseUrl));

    request.fields["user"] = data.phoneNumber!.phoneNumber!;
    request.fields["route"] = data.route.toString();
    request.fields["emotion"] = data.emotion.toString();
    request.fields["description"] = data.description.toString();
    jsonEncode(request.fields["data"]);

    request.headers['Content-Type'] = 'multipart/form-data';
    if (jwt != "") {
      request.headers['Authorization'] = "Bearer ${jwt.toString()}";
    }
    var multipartFile = await http.MultipartFile.fromPath(
        "file", data.image.path,);

    request.files.add(multipartFile);
    http.StreamedResponse streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);
    print(response.statusCode);
    var response2;
    var responseUpdate;
    if(response.statusCode==200)
    {
      http.MultipartRequest request2 = new http.MultipartRequest('POST', Uri.parse(predictUrl));
      request2.headers['Content-Type'] = 'multipart/form-data';
      var multipartFile = await http.MultipartFile.fromPath(
        "file", data.image.path,);

      request2.files.add(multipartFile);
      http.StreamedResponse streamedResponse = await request2.send();
       response2 = await http.Response.fromStream(streamedResponse);
       if(response2.statusCode==200)
         {
           var msg=jsonDecode(response2.body)["class"];
           print(msg);
           responseUpdate=await routeService.updateRoute(jwt, data.route, msg);
           if(responseUpdate.statusCode==200)
             {
               return msg;
             }
         }
    }
    return "error";

  }
  
}