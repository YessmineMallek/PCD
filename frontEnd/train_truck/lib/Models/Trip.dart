import 'package:train_truck/Models/Route.dart';
import 'package:train_truck/Models/StopsTime.dart';

class Trip {
  String? tripId;
  Route? route;
  int? serviceId;
  String? weekDay;
  String? tripHeadsign;
  String? tripShortName;
  List<StopsTime>? stopsTime;

  Trip(
      {this.tripId,
        this.route,
        this.serviceId,
        this.weekDay,
        this.tripHeadsign,
        this.stopsTime,
        this.tripShortName});

  Trip.fromJson(Map<String, dynamic> json) {
    tripId = json['trip_id'];
    route = json['route'] != null ? new Route.fromJson(json['route']) : null;
    serviceId = json['service_id'];
    weekDay=extractweekDay(json['service_id']);

    tripHeadsign = json['trip_headsign'];
    tripShortName = json['trip_short_name'];
    if (json['stopsTime'] != null) {
      stopsTime = <StopsTime>[];
      json['stopsTime'].forEach((v) {
        stopsTime!.add(new StopsTime.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['trip_id'] = this.tripId;
    if (this.route != null) {
      data['route'] = this.route!.toJson();
    }
    data['service_id'] = this.serviceId;
    data['trip_headsign'] = this.tripHeadsign;
    data['trip_short_name'] = this.tripShortName;
    if (this.stopsTime != null) {
      data['stopsTime'] = this.stopsTime!.map((v) => v.toJson()).toList();
    }
    return data;
  }
  String extractweekDay(int serviceId)
  {
    var str="";
    if(serviceId==427)
      str="Quotidien";
    if(serviceId==428)
      str="Lundi au Samedi";
    if(serviceId==429)
      str="Lundi au Vendredi";
    if(serviceId==430)
      str="Samedi";
    if(serviceId==432)
      str="Vendredi";
    if(serviceId==433)
      str="Lundi au Jeudi";

    return str;
  }
}
