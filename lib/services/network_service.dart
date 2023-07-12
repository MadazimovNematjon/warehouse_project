import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:warehouse_project/model/transaction_model.dart';
import 'package:warehouse_project/model/user_profile_list_model.dart';
import 'package:warehouse_project/services/log_service.dart';
import '../model/image_model.dart';
import '../model/product_model.dart';
import '../model/user_model.dart';


class NetworkService {
  static final dio = Dio();
  static int currentPage = 0;
  static const String BASE = "192.168.20.49:8080";

  static Map<String, String> headers = {
    'Content-Type': 'application/json; charset=UTF-8'
  };

  static const String API_SIGNUP = "/auth/registration";
  static const String API_SIGNIN = "/auth/login";
  static const String API_IMAGE = "/attach/upload";
  static const String API_CREATEPRO = "/product/create";
  static const String API_GETLISTPRO = "/product/getListProduct";
  static const String API_PROFILE_LIST =  "/profile/list";


  /*Pagebal product*/
  static Future<ProductModel?> fetchProductModel() async {
  final response = await http.get(Uri.parse('http://192.168.20.49:8080/product/getListProduct?page=0&size=10'));

  try{
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return ProductModel.fromJson(jsonData);
    }
  }catch(e){
    LogService.w(e.toString());
  }
  return null;
}

  static Future<String?> GET(String api, Map<String, dynamic> params) async {
    final uri = Uri.https(BASE, api, params);
    dio.options.headers = headers;
// Content content;

    try {
      final response = await dio.get(uri.toString());
      if (response.statusCode == 200) {
        return response.data;
      }
    } on DioError catch (e) {
      if (e.response != null) {
        LogService.d('GET Error: ${e.response!.statusCode} - ${e.response!.data}');
        return e.response!.data.toString();
      } else {
       LogService.w('POST Error: ${e.error}');
      }
    }

    return null;
  }
/* POST */
  static Future<String?> POST(String api, Map<String, dynamic> params) async {
    final uri = Uri.http(BASE, api);
    dio.options.headers = headers;

    try {
      final response = await dio.post(uri.toString(), data: params);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonEncode(response.data);
      }
    } on DioError catch (e) {
      if (e.response != null) {
       LogService.d('POST Error: ${e.response!.statusCode} - ${e.response!.data}');
        return e.response!.data.toString();
      } else {
        LogService.w('POST Error: ${e.error}');
      }
    }

    return null;
  }

  static Map<String, String> paramsCreate(UserModel user) {
    final params = <String, String>{
      "name": user.name ?? "",
      "surname": user.surname ?? "",
      "email": user.email ?? "",
      "password": user.password ?? "",
    };
    return params;
  }

  static Map<String, String> paramsSing(UserModel user) {
    final params = <String, String>{
      "email": user.email ?? "",
      "password": user.password ?? "",
    };
    return params;
  }

  static Map<String,dynamic> paramsEmpty(){
    Map<String,dynamic> params = {};
    return params;
  }

  static Map<String, dynamic> paramsProduct(Content content) {
    Map<String,dynamic> params=  {
      "id": content.id ?? "",
      "productName": content.productName ?? "",
      "createDate": content.createDate.toString(),
      "productAbout": content.productAbout ?? "",
      "product_quantity_type": content.product_quantity_type ?? "",
      "email": content.email ?? "",
      "image_url": content.image_url ?? "",
      "ownerProfileId": content.ownerProfileId.toString(),
      "quantity": content.quantity ?? "",
      "price" : content.price ?? "",
    };
    return params;
  }

  static Map<String,dynamic> paramsPageable(Pageable pageable) {
     Map<String,dynamic> params ={
      "sort": pageable.sort!.toJson(),
      "pageSize": pageable.pageSize,
      "pageNumber": pageable.pageNumber,
      "offset": pageable.offset,
      "paged": pageable.paged,
      "unpaged": pageable.unpaged,
    };
    return params;
  }

  static Map<String,dynamic> paramsSort(Sort sort){
  Map<String,dynamic> params = <String,dynamic>{
      "sorted": sort.sorted,
  "empty": sort.empty,
  "unsorted": sort.unsorted,
    };
    return params;
}

  static Map<String,dynamic> paramsTransaction(TransactionModel transaction){
    Map<String,dynamic> params = {
      "product_id": transaction.productId,
      "quantityOfProduct": transaction.quantityOfProduct,
      "sender_email": transaction.senderEmail,
      "reciver_email": transaction.reciverEmail,
    };
    return params;
  }

  static Map<String, String> paramsImage(ImageModel image) {
    final params = <String, String>{
      "file": image.file ?? "",
    };
    return params;
  }

  // static Map<String,dynamic>? paramProfileList(ProfileListModel profile){
  //   Map<String,String> params = {
  //     "id": profile.id.toString() ?? "",
  //     "name": profile.name ?? "",
  //     "surname": profile.surname ?? "",
  //     "email": profile.email ?? "",
  //     "role": profile.role ?? "",
  //   };
  //   return params;
  // }
  // static List<ProfileListModel> parseProfileList(String response) {
  //   dynamic json = jsonDecode(response);
  //   var data = List<ProfileListModel>.from(
  //       json.map((x) => ProfileListModel.fromJson(x)));
  //   LogService.i(data.toString());
  //   return data;
  // }

  static List<ProfileListModel> parseProfileList(String response) {
    List<ProfileListModel> data = [];
    try {
      dynamic json = jsonDecode(response);
      if (json is List) {
        data = json.map((x) => ProfileListModel.fromJson(x)).toList();
        LogService.i(data.toString());
      } else {
        LogService.e('Invalid JSON format for profile list');
      }
    } catch (e) {
      LogService.e('Error parsing profile list: $e');
    }
    return data;
  }


}

