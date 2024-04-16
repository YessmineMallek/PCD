import 'package:train_truck/Models/Trip.dart';

class Route {
  int? routeId;
  int? agancy;
  String? routeShortName=" ";
  String? routeLongName=" ";

  Route(
      {this.routeId,
         this.agancy,
         this.routeShortName,
         this.routeLongName});

  Route.fromJson(Map<String, dynamic> json) {
    routeId = json['route_id'];
    agancy = json['agancy'];
    routeShortName = json['route_short_name'];
    routeLongName = json['route_long_name'];
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