
class GetIamage {
  final String? id;
  final String? originalName;
  final String? path;
  final String? size;
  final String? extension;
  final String? createdData;
  final String? url;

  GetIamage({
    this.id,
    this.originalName,
    this.path,
    this.size,
    this.extension,
    this.createdData,
    this.url,
  });

  factory GetIamage.fromJson(Map<String, dynamic> json) => GetIamage(
    id: json["id"],
    originalName: json["originalName"],
    path: json["path"],
    size: json["size"],
    extension: json["extension"],
    createdData: json["createdData"],
    url: json["url"],
  );


  Map<String, dynamic> toJson() => {
    "id": id,
    "originalName": originalName,
    "path": path,
    "size": size,
    "extension": extension,
    "createdData": createdData,
    "url": url,
  };
}
