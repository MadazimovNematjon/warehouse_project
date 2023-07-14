class TransactionModel {
  final int? productId;
  final int? quantityOfProduct;
  final String? senderEmail;
  final String? reciverEmail;

  TransactionModel({
    this.productId,
    this.quantityOfProduct,
    this.senderEmail,
    this.reciverEmail,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) => TransactionModel(
    productId: json["product_id"],
    quantityOfProduct: json["quantityOfProduct"],
    senderEmail: json["sender_email"],
    reciverEmail: json["reciver_email"],
  );

  Map<String, dynamic> toJson() => {
    "product_id": productId,
    "quantityOfProduct": quantityOfProduct,
    "sender_email": senderEmail,
    "reciver_email": reciverEmail,
  };
}
