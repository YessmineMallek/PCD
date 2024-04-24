import 'dart:typed_data';

import 'package:train_truck/Models/Route.dart';
import 'package:train_truck/Models/User.dart';

class Reclamation {
  User? phoneNumber;
  Route? route;
  String? emotion;
  String? description;
  ByteBuffer? image;


  Reclamation({this.phoneNumber,this.route, this.emotion, this.description, this.image});

  Reclamation.fromJson(Map<String, dynamic> json) {
    phoneNumber = User.fromJson(json["user"]);
    route =Route.fromJson(json['route']);
    emotion = json['emotion'];
    description = json['description'];
    image = json['image'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user'] =this.phoneNumber?.toJson() ;
    data['route'] = this.route?.toJson();
    data['emotion'] = this.emotion;
    data['description'] = this.description;
    data['image'] = this.image;
    return data;
  }
}