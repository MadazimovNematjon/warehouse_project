// To parse this JSON data, do
//
//     final transactionHistoryModel = transactionHistoryModelFromJson(jsonString);

import 'dart:convert';

List<TransactionHistoryModel> transactionHistoryModelFromJson(String str) => List<TransactionHistoryModel>.from(json.decode(str).map((x) => TransactionHistoryModel.fromJson(x)));

String transactionHistoryModelToJson(List<TransactionHistoryModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TransactionHistoryModel {
  final int? id;
  final String? productName;
  final String? productAbout;
  final dynamic productType;
  final String? productImageUrl;
  final int? productQuantityOfProduct;
  final String? productQuantityType;
  final String? senderEmail;
  final String? resvierEmail;

  TransactionHistoryModel({
    this.id,
    this.productName,
    this.productAbout,
    this.productType,
    this.productImageUrl,
    this.productQuantityOfProduct,
    this.productQuantityType,
    this.senderEmail,
    this.resvierEmail,
  });

  factory TransactionHistoryModel.fromJson(Map<String, dynamic> json) => TransactionHistoryModel(
    id: json["id"],
    productName: json["product_name"],
    productAbout: json["product_about"],
    productType: json["product_type"],
    productImageUrl: json["product_image_url"],
    productQuantityOfProduct: json["product_quantity_of_product"],
    productQuantityType: json["product_quantity_type"],
    senderEmail: json["sender_email"],
    resvierEmail: json["resvier_email"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "product_name": productName,
    "product_about": productAbout,
    "product_type": productType,
    "product_image_url": productImageUrl,
    "product_quantity_of_product": productQuantityOfProduct,
    "product_quantity_type": productQuantityType,
    "sender_email": senderEmail,
    "resvier_email": resvierEmail,
  };
}
