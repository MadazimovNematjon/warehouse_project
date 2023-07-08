class UserModel {
  String? id;
  String? name;
  String? surname;
  String? email;
  String? password;
  String? status;
  String? role;
  String? visible;
  String? createdDate;

  UserModel({
    this.name,
    this.surname,
    required this.email,
    required this.password,
    this.createdDate,
  });

  UserModel.fromJson(Map<String, dynamic> json)
      : id = json["id"].toString(),
        name = json["name"],
        surname = json["surname"],
        email = json["email"],
        password = json["password"],
        status = json["status"],
        role = json["role"],
        visible = json["visible"].toString(),
        createdDate = json["createdDate"].toString();

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "surname": surname,
        "email": email,
        "password": password,
        "status": status,
        "role": role,
        "visible": visible,
        "createdDate": createdDate,
      };
}
