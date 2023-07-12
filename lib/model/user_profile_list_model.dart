// To parse this JSON data, do
//
//     final post = postFromJson(jsonString);

import 'dart:convert';

List<ProfileListModel> postFromJson(String str) => List<ProfileListModel>.from(json.decode(str).map((x) => ProfileListModel.fromJson(x)));

String postToJson(List<ProfileListModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProfileListModel {
  final int? id;
  final String? name;
  final String? surname;
  final String? email;
  final String? role;
  final bool? visible;
  final DateTime? createdDate;

  ProfileListModel({
    this.id,
    this.name,
    this.surname,
    this.email,
    this.role,
    this.visible,
    this.createdDate,
  });

  factory ProfileListModel.fromJson(Map<String, dynamic> json) => ProfileListModel(
    id: json["id"],
    name: json["name"],
    surname: json["surname"],
    email: json["email"],
    role: json["role"],
    visible: json["visible"],
    createdDate: json["createdDate"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "surname": surname,
    "email": email,
    "role": role,
    "visible": visible,
    "createdDate": createdDate,
  };
}
