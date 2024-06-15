import 'package:train_truck/Models/Trip.dart';

class Route {
  int? routeId;
  int? agancy;
  String? routeShortName=" ";
  String? routeLongName=" ";
  List<Trip>? trip;
  String? etat;


  Route(
      {this.routeId,
         this.agancy,
        this.trip,
        this.routeShortName,
         this.routeLongName,
      this.etat});

  Route.fromJson(Map<String, dynamic> json) {
    routeId = json['route_id'];
    agancy = json['agancy'];
    routeShortName = json['routeShortName'];
    routeLongName = json['routeLongName'];
    etat=json["etat"];

    if (json['trips'] != null) {
      trip = <Trip>[];
      json['trips'].forEach((v) {
        trip!.add(new Trip.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['route_id'] = this.routeId;
    data['agancy'] = this.agancy;
    data['route_short_name'] = this.routeShortName;
    data['route_long_name'] = this.routeLongName;
    return data;
  }
}