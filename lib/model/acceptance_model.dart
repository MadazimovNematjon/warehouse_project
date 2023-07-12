class AcceptanceModel{
  final int? transaction_id;
  final String? acceptanceOrRejection;

  AcceptanceModel({this.transaction_id,this.acceptanceOrRejection});

  factory  AcceptanceModel.fromJson(Map<String,dynamic> json) =>AcceptanceModel(
    transaction_id: json["transaction_id"],
    acceptanceOrRejection: json["acceptanceOrRejection"],
  );

  Map<String,dynamic> toJson() => {
    "transaction_id": transaction_id,
    "acceptanceOrRejection":acceptanceOrRejection
};

}