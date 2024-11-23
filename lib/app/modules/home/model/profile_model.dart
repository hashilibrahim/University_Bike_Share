import 'dart:convert';

User userModelFromJson(String str) => User.fromJson(json.decode(str));

String userModelToJson(User data) => json.encode(data.toJson());

class User {
  String? id;
  int? mobileNumber;
  dynamic profilePicture;
  String? gender;
  String? hostelName;
  String? departMent;
  bool? isRegistered;
  String? collegeId;
  int? version;

  User({
    this.id,
    this.mobileNumber,
    this.profilePicture,
    this.gender,
    this.hostelName,
    this.departMent,
    this.isRegistered,
    this.collegeId,
    this.version,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'],
      mobileNumber: json['mobileNumber'],
      profilePicture: json['profilePicture'],
      gender: json['gender'],
      hostelName: json['hostelName'],
      departMent: json['departMent'],
      isRegistered: json['isRegistered'],
      collegeId: json['collegeId'] as String?,
      version: json['__v'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'mobileNumber': mobileNumber,
      'profilePicture': profilePicture,
      'gender': gender,
      'hostelName': hostelName,
      'departMent': departMent,
      'isRegistered': isRegistered,
      'collegeId': collegeId,
      '__v': version,
    };
  }

  @override
  String toString() {
    return 'User{id: $id, mobileNumber: $mobileNumber, profilePicture: $profilePicture, gender: $gender, hostelName: $hostelName, departMent: $departMent, isRegistered: $isRegistered, collegeId: $collegeId, version: $version}';
  }
}
