

import 'package:train_truck/Models/Route.dart';
import 'package:train_truck/Models/User.dart';

class Reclamation {
  User? phoneNumber;
  String route=" ";
  String? emotion;
  String? description;
  dynamic? image;


  Reclamation({this.phoneNumber,route, this.emotion, this.description, this.image});

  Reclamation.fromJson(Map<String, dynamic> json) {
    phoneNumber = User.fromJson(json["user"]);
    //route =Route.fromJson(json['route']);
    emotion = json['emotion'];
    description = json['description'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user'] =this.phoneNumber?.toJson() ;
    //data['route'] = this.route?.toJson();
    data['emotion'] = this.emotion;
    data['description'] = this.description;
    return data;
  }
}