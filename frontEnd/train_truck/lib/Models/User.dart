class User {
  String? firstName;
  String? lastName;
  String? passwordUser;
  String? phoneNumber;
  int? activated;

  User({this.firstName, this.lastName, this.passwordUser, this.phoneNumber,this.activated});

  User.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    passwordUser = json['password_user'];
    phoneNumber = json['phoneNumber'];
    activated =json['activated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['password_user'] = this.passwordUser;
    data['phoneNumber'] = this.phoneNumber;
    return data;
  }
}