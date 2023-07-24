import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:warehouse_project/model/product_model.dart';
import 'package:warehouse_project/model/user_model.dart';
import 'package:warehouse_project/services/log_service.dart';
import 'package:warehouse_project/services/save_secure_storage.dart';

class ProductSearchController extends GetxController {
  String searchText = "";
  List<Content> searchResults = [];
  final inputController = TextEditingController();

  Future searchProducts(String searchTerm) async {
    try {
      final searchUrl =
          'http://192.168.100.49:8080/product/searchProductByName/%7Bname%7D?name=$searchTerm';

      final response = await http.get(Uri.parse(searchUrl));
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body) as List<dynamic>;
        final products = jsonData.map((item) => Content.fromJson(item)).toList();

        UserModel? currentUser = await SecureStorage.getData();

        if (currentUser != null) {
          // Exclude the current user from the search results
          products.removeWhere((products) => products.email != currentUser.email);
        }

        searchResults = products;
        LogService.w("${searchResults.first.productName}");
      }
    } catch (error) {
      LogService.e(error.toString());
      throw Exception('Error while fetching data: $error');
    }
    // Notify the GetX controller to update the UI
    update();
  }
}
