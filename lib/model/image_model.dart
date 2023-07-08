// To parse this JSON data, do
//
//     final imageModel = imageModelFromJson(jsonString);

import 'dart:convert';

ImageModel imageModelFromJson(String str) => ImageModel.fromJson(json.decode(str));

String imageModelToJson(ImageModel data) => json.encode(data.toJson());

class ImageModel {
  final String? file;

  ImageModel({
this.file
  });

  factory ImageModel.fromJson(Map<String, dynamic> json) => ImageModel(
    file: json["file"],
  );

  Map<String, dynamic> toJson() => {
    "file": file,

  };
}
