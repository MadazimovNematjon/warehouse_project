// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  final String? name;
  final String? surname;
  final String? password;
  final String? role;
  final String? token;
  final int? id;
  final String? email;
  final String? imageUrl;
  final String? phone;
  final String? city;
  final String? status;
  final bool? visible;
  final DateTime? createdDate;

  UserModel({
    this.name,
    this.surname,
    this.password,
    this.role,
    this.token,
    this.id,
    this.email,
    this.imageUrl,
    this.phone,
    this.city,
    this.status,
    this.visible,
    this.createdDate,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    name: json["name"],
    surname: json["surname"],
    password: json["password"],
    role: json["role"],
    token: json["token"],
    id: json["id"],
    email: json["email"],
    imageUrl: json["image_url"],
    phone: json["phone"],
    city: json["city"],
    status: json["status"],
    visible: json["visible"],
    createdDate: json["createdDate"] == null ? null : DateTime.parse(json["createdDate"]),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "surname": surname,
    "password" : password,
    "role": role,
    "token": token,
    "id": id,
    "email": email,
    "image_url": imageUrl,
    "phone": phone,
    "city": city,
    "status": status,
    "visible": visible,
    "createdDate": createdDate?.toIso8601String(),
  };
}
