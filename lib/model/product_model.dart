import 'dart:convert';

class ProductModel {
  final List<Content>? content;
  final Pageable? pageable;
  final int? totalPages;
  final int? totalElements;
  final bool? last;
  final int? number;
  final int? size;
  final int? numberOfElements;
  final Sort? sort;
  final bool? first;
  final bool? empty;

  ProductModel({
    this.content,
    this.pageable,
    this.totalPages,
    this.totalElements ,
    this.last ,
    this.number ,
    this.size ,
    this.numberOfElements,
    this.sort,
    this.first,
    this.empty,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    content: json["content"] == null ? [] : List<Content>.from(json["content"]!.map((x) => Content.fromJson(x))),
    pageable: json["pageable"] == null ? null : Pageable.fromJson(json["pageable"]),
    totalPages: json["totalPages"],
    totalElements: json["totalElements"],
    last: json["last"],
    number: json["number"],
    size: json["size"],
    numberOfElements: json["numberOfElements"],
    sort: json["sort"] == null ? null : Sort.fromJson(json["sort"]),
    first: json["first"],
    empty: json["empty"],
  );

  Map<String, dynamic> toJson() => {
    "content": content == null ? [] : List<dynamic>.from(content!.map((x) => x.toJson())),
    "pageable": pageable?.toJson(),
    "totalPages": totalPages,
    "totalElements": totalElements,
    "last": last,
    "number": number,
    "size": size,
    "numberOfElements": numberOfElements,
    "sort": sort?.toJson(),
    "first": first,
    "empty": empty,
  };
}



List<Content> contentFromJson(String str) => List<Content>.from(json.decode(str).map((x) => Content.fromJson(x)));

String contentToJson(List<Content> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


class Content {
  int? id;
  String? ownerProfileId;
  String? productName;
  String? createDate;
  String? productAbout; // Update the type to dynamic
  String? product_quantity_type;
  String? email;
  String? image_url;
  String? quantity;
  String? price;

  Content({
    this.id,
    this.ownerProfileId,
    this.productName,
    this.createDate,
    this.productAbout,
    this.product_quantity_type,
    this.email,
    this.image_url,
    this.quantity,
    this.price,
  });

  factory Content.fromJson(Map<String, dynamic> json) {
    return Content(
      id: json["id"],
      productName: json["productName"].toString(),
      createDate: json["createDate"].toString(),
      productAbout: json["productAbout"],
      product_quantity_type: json["product_quantity_type"].toString(),
      email: json["email"].toString(),
      ownerProfileId: json["ownerProfileId"].toString(),
      image_url: json["image_url"].toString(),
      quantity: json["quantity"].toString(),
      price: json["price"].toString(),
    );
  }


  Map<String, dynamic> toJson() => {
    "id": id,
    "productName": productName,
    "productAbout": productAbout,
    "quantity": quantity,
    "product_quantity_type": product_quantity_type,
    "price": price,
    "email": email,
    "ownerProfileId": ownerProfileId,
    "createDate": createDate,
    "image_url": image_url,
  };
}


class Pageable {
  final Sort? sort;
  final int? pageSize;
  final int? pageNumber;
  final int? offset;
  final bool? paged;
  final bool? unpaged;

  Pageable({
    this.sort,
    this.pageSize ,
    this.pageNumber,
    this.offset ,
    this.paged ,
    this.unpaged ,
  });

  factory Pageable.fromJson(Map<String, dynamic> json) => Pageable(
    sort: json["sort"] == null ? null : Sort.fromJson(json["sort"]),
    pageSize: json["pageSize"],
    pageNumber: json["pageNumber"],
    offset: json["offset"],
    paged: json["paged"],
    unpaged: json["unpaged"],
  );

  Map<String, dynamic> toJson() => {
    "sort": sort?.toJson(),
    "pageSize": pageSize,
    "pageNumber": pageNumber,
    "offset": offset,
    "paged": paged,
    "unpaged": unpaged,
  };
}

class Sort {
  final bool? sorted;
  final bool? empty;
  final bool? unsorted;

  Sort({
    this.sorted,
    this.empty,
    this.unsorted,
  });

  factory Sort.fromJson(Map<String, dynamic> json) => Sort(
    sorted: json["sorted"],
    empty: json["empty"],
    unsorted: json["unsorted"],
  );

  Map<String, dynamic> toJson() => {
    "sorted": sorted,
    "empty": empty,
    "unsorted": unsorted,
  };
}
