
class OrderModel {

  String? title;
  String? name;
  String? data;
  String? uid;
  String? image;

  OrderModel({this.title, this.name, this.data});

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      OrderModel(
        title: json['title'],
        name: json['name'],
        data: json['data'],

      );

  Map<String, dynamic> toJson() =>
      {
        'title': title,
        'name': name,
        'data': data,
      };
}