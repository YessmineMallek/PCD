class Stop {
  int? stopId;
  String? stopCode;
  String? stopName;
  String? stopDesc;
  double? stopLat;
  double? stopLon;
  String? zoneId;
  String? stopUrl;
  String? locationType;
  String? parentStation;

  Stop(
      {this.stopId,
      this.stopCode,
      this.stopName,
      this.stopDesc,
      this.stopLat,
      this.stopLon,
      this.zoneId,
      this.stopUrl,
      this.locationType,
      this.parentStation});

  Stop.fromJson(dynamic json) {
    stopCode = json['stop_code'];
    stopName = json['stop_name'];
    stopDesc = json['stop_desc'];
    stopLat = json['stop_lat'];
    stopLon = json['stop_lon'];
    zoneId = json['zone_id'];
    stopUrl = json['stop_url'];
    locationType = json['location_type'];
    parentStation = json['parent_station'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['stop_id'] = this.stopId;
    data['stop_code'] = this.stopCode;
    data['stop_name'] = this.stopName;
    data['stop_desc'] = this.stopDesc;
    data['stop_lat'] = this.stopLat;
    data['stop_lon'] = this.stopLon;
    data['zone_id'] = this.zoneId;
    data['stop_url'] = this.stopUrl;
    data['location_type'] = this.locationType;
    data['parent_station'] = this.parentStation;
    return data;
  }
}
