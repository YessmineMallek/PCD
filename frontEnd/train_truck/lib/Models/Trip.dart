import 'package:train_truck/Models/Route.dart';

class Trip {
  String? tripId;
  Route? route;
  int? serviceId;
  String? tripHeadsign;
  String? tripShortName;

  Trip(
      {this.tripId,
        this.route,
        this.serviceId,
        this.tripHeadsign,
        this.tripShortName});

  Trip.fromJson(Map<String, dynamic> json) {
    tripId = json['trip_id'];
    route = json['route'] != null ? new Route.fromJson(json['route']) : null;
    serviceId = json['service_id'];
    tripHeadsign = json['trip_headsign'];
    tripShortName = json['trip_short_name'];
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
    return data;
  }
}
