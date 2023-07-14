import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:warehouse_project/services/log_service.dart';

import '../model/user_model.dart';

class SecureStorage{



  static const storage = FlutterSecureStorage();

  static Future<void> saveData(Map<String, dynamic> data) async {
    // Convert the map to a JSON string
    String jsonString = jsonEncode(data);

    // Save the JSON string in secure storage
    await storage.write(key: 'data', value: jsonString);
    LogService.i("Saved Account");
  }




  static Future<UserModel?> getData() async {
    // Retrieve the JSON string from secure storage
    String? jsonString = await storage.read(key: 'data');

    if (jsonString != null) {
      try {
        // Parse the JSON string back into a Map object
        Map<String, dynamic> data = jsonDecode(jsonString);

        // Extract the nested map from the "response" key
        dynamic responseData = data['response'];

        if (responseData is String) {
          // Parse the JSON-encoded string into a Map object
          Map<String, dynamic> responseMap = jsonDecode(responseData);
          responseData = responseMap;
        }

        if (responseData != null && responseData is Map<String, dynamic>) {
          // Create a new UserModel object from the parsed JSON data
          UserModel user = UserModel.fromJson(responseData);

          return user;
        }
      } catch (e, stackTrace) {
        LogService.w(e.toString());
        LogService.w(stackTrace.toString());
      }
    }

    return null;
  }



}