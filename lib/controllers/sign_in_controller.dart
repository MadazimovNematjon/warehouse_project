import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:warehouse_project/model/user_model.dart';
import 'package:warehouse_project/services/log_service.dart';
import 'package:warehouse_project/services/network_service.dart';
import 'package:http/http.dart' as http;
import 'package:warehouse_project/services/save_secure_storage.dart';

import '../pages/main_screen_page.dart';


class SignInController extends GetxController{

  final gmailController = TextEditingController();
  final passwordController = TextEditingController();


 Future<void> doSignIn() async {
    String gmail = gmailController.text.toString().trim();
    String password = passwordController.text.toString().trim();

    if (gmail.isEmpty || password.isEmpty) return;

    var member = UserModel(email: gmail, password: password);

    await NetworkService.POST(
        NetworkService.API_SIGNIN, NetworkService.paramsSignIn(member))
        .then((data) => _verifyEmail(data!));
  }


  // void dataSave(String data) {
  //   if(data != null){
  //     SecureStorage.saveData({'response': data});// Storing the string in a map with a key 'response'
  //
  //     Get.off(const MainScreen());
  //     update();
  //   }
  // }

  void _verifyEmail(String data) async {
    try {
      final userModel = userModelFromJson(data);
LogService.i("${userModel.token}");
      final response = await http.get(
        Uri.parse('http://192.168.100.49:8080/auth/verification/email/${userModel.token}'),
      );

      if (response.statusCode == 200) {
          LogService.i("Email verification successful!${response.body}");
          SecureStorage.saveData({'response': data});// Storing the string in a map with a key 'response'

            Get.off(const MainScreen());
            update();
      } else {

          LogService.i( "Email verification failed!");

      }
    } catch (e) {
      LogService.e(e.toString());
    }
  }

}