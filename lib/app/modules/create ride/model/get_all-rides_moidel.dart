// To parse this JSON data, do
//
//     final getAllRidesModel = getAllRidesModelFromJson(jsonString);

import 'dart:convert';

GetAllRidesModel getAllRidesModelFromJson(String str) =>
    GetAllRidesModel.fromJson(json.decode(str));

String getAllRidesModelToJson(GetAllRidesModel data) =>
    json.encode(data.toJson());

class GetAllRidesModel {
  List<Ride>? rides;

  GetAllRidesModel({
    this.rides,
  });

  factory GetAllRidesModel.fromJson(Map<String, dynamic> json) =>
      GetAllRidesModel(
        rides: json["rides"] == null
            ? []
            : List<Ride>.from(json["rides"]!.map((x) => Ride.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "rides": rides == null
            ? []
            : List<dynamic>.from(rides!.map((x) => x.toJson())),
      };
}

class Ride {
  String? id;
  String? startPoint;
  String? endPoint;
  String? startTime;
  String? genderPreference;
  String? vehicleType;
  int? phoneNumber;
  UserId? userId;
  List<UserId>? showIntrests;
  int? v;

  Ride({
    this.id,
    this.startPoint,
    this.endPoint,
    this.startTime,
    this.genderPreference,
    this.vehicleType,
    this.phoneNumber,
    this.userId,
    this.showIntrests,
    this.v,
  });

  factory Ride.fromJson(Map<String, dynamic> json) => Ride(
        id: json["_id"],
        startPoint: json["startPoint"],
        endPoint: json["endPoint"],
        startTime: json["startTime"],
        genderPreference: json["genderPreference"],
        vehicleType: json["vehicleType"],
        phoneNumber: json["phoneNumber"],
        userId: json["userId"] == null ? null : UserId.fromJson(json["userId"]),
        showIntrests: json["showIntrests"] == null
            ? []
            : List<UserId>.from(
                json["showIntrests"]!.map((x) => UserId.fromJson(x))),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "startPoint": startPoint,
        "endPoint": endPoint,
        "startTime": startTime,
        "genderPreference": genderPreference,
        "vehicleType": vehicleType,
        "phoneNumber": phoneNumber,
        "userId": userId?.toJson(),
        "showIntrests": showIntrests == null
            ? []
            : List<dynamic>.from(showIntrests!.map((x) => x.toJson())),
        "__v": v,
      };
}

class UserId {
  String? id;
  int? mobileNumber;
  String? profilePicture;
  String? fullName;
  String? gender;
  String? hostelName;
  String? departMent;
  bool? isRegistered;
  String? collegeId;
  int? v;

  UserId({
    this.id,
    this.mobileNumber,
    this.profilePicture,
    this.fullName,
    this.gender,
    this.hostelName,
    this.departMent,
    this.isRegistered,
    this.collegeId,
    this.v,
  });

  factory UserId.fromJson(Map<String, dynamic> json) => UserId(
        id: json["_id"],
        mobileNumber: json["mobileNumber"],
        profilePicture: json["profilePicture"],
        fullName: json["fullName"],
        gender: json["gender"],
        hostelName: json["hostelName"],
        departMent: json["departMent"],
        isRegistered: json["isRegistered"],
        collegeId: json["collegeId"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "mobileNumber": mobileNumber,
        "profilePicture": profilePicture,
        "fullName": fullName,
        "gender": gender,
        "hostelName": hostelName,
        "departMent": departMent,
        "isRegistered": isRegistered,
        "collegeId": collegeId,
        "__v": v,
      };
}
