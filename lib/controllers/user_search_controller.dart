import 'dart:convert';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:warehouse_project/model/user_model.dart';
import 'package:warehouse_project/services/log_service.dart';
import 'package:warehouse_project/services/save_secure_storage.dart';

class UserSearchController extends GetxController{
  List<UserModel> searchResults = [];
  final inputController = TextEditingController();

  // Future searchUser(String searchTerm)async{
  //   try{
  //     final searchUrl = "http://192.168.20.49:8080/profile/searchProfileByName/%7Bname%7D?name=$searchTerm";
  //     final response = await http.get(Uri.parse(searchUrl));
  //     if(response.statusCode == 200){
  //       final jsonData = jsonDecode(response.body) as List<dynamic>;
  //       final users = jsonData.map((item) => UserModel.fromJson(item)).toList();
  //
  //       UserModel? user = await SecureStorage.getData();
  //
  //       LogService.w(searchResults.toString());
  //     }
  //   }catch(e){
  //     LogService.e(e.toString());
  //   }
  //   update();
  // }

  Future searchUser(String searchTerm) async {
    try {
      final searchUrl =
          "http://192.168.20.49:8080/profile/searchProfileByName/%7Bname%7D?name=$searchTerm";
      final response = await http.get(Uri.parse(searchUrl));
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body) as List<dynamic>;
        final users =
        jsonData.map((item) => UserModel.fromJson(item)).toList();

        UserModel? currentUser = await SecureStorage.getData();
        if (currentUser != null) {
          // Exclude the current user from the search results
          users.removeWhere((user) => user.id == currentUser.id);
        }

        searchResults = users;
      }
    } catch (e) {
      LogService.e(e.toString());
    }
    update();
  }

}