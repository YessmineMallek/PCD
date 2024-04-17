import 'package:train_truck/Models/Stop.dart';

class StopsTime {
  int? stopTimesId;
  String? arrivalTime;
  String? departureTime;
  int? stopSequence;
  String? stopHeadsign;
  Stop? stopId;
  int? pickupType;
  int? dropOffType;
  int? shapeDistTraveled;

  StopsTime(
      {this.stopTimesId,
        this.arrivalTime,
        this.departureTime,
        this.stopSequence,
        this.stopHeadsign,
        this.pickupType,
        this.dropOffType,
        this.shapeDistTraveled});

  StopsTime.fromJson(Map<String, dynamic> json) {
    stopTimesId = json['stopTimesId'];
    arrivalTime = json['arrival_time'];
    if(json["stop_id"]!=null)
    {
        stopId=Stop.fromJson(json["stop_id"]);
    }
    departureTime = json['departure_time'];
    stopSequence = json['stop_sequence'];
    stopHeadsign = json['stop_headsign'];
    pickupType = json['pickup_type'];
    dropOffType = json['drop_off_type'];
    shapeDistTraveled = json['shape_dist_traveled'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['stopTimesId'] = this.stopTimesId;
    data['arrival_time'] = this.arrivalTime;
    data['departure_time'] = this.departureTime;
    data['stop_sequence'] = this.stopSequence;
    data['stop_headsign'] = this.stopHeadsign;
    data['pickup_type'] = this.pickupType;
    data['drop_off_type'] = this.dropOffType;
    data['shape_dist_traveled'] = this.shapeDistTraveled;
    return data;
  }
}