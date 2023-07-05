// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  String? number;
  String? lastName;
  String? id;
  String? firstName;
  String? email;

  UserModel({
    this.number,
    this.lastName,
    this.id,
    this.firstName,
    this.email,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        number: json["number"],
        lastName: json["last_name"],
        id: json["id"],
        firstName: json["first_name"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "number": number,
        "last_name": lastName,
        "id": id,
        "first_name": firstName,
        "email": email,
      };
}
