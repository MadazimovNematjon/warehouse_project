import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warehouse_project/model/user_model.dart';
import 'package:warehouse_project/pages/main_screen_page.dart';
import 'package:warehouse_project/services/log_service.dart';
import 'package:warehouse_project/services/network_service.dart';
import 'package:warehouse_project/services/save_secure_storage.dart';
import 'package:warehouse_project/utility/utils_service.dart';


class SignUpController extends GetxController{

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final gmailController = TextEditingController();
  final passwordController = TextEditingController();
  final againPasswordController = TextEditingController();

  Future<void> doSignUp() async{

    String firstName = firstNameController.text.toString().trim();
    String lastName = lastNameController.text.toString().trim();
    String gmail = gmailController.text.toString().trim();
    String password = passwordController.text.toString().trim();
    String aPassword = againPasswordController.text.toString().trim();

    if(firstName.isEmpty || lastName.isEmpty || gmail.isEmpty || password.isEmpty) return ;
    if(password != aPassword) return;

    var user = UserModel(name: firstName,surname: lastName,email: gmail,password: password,createdDate: UtilsService.currantDate().toString());

    await NetworkService.POST(NetworkService.API_SIGNUP, NetworkService.paramsCreate(user)).then((dynamic data) {
      if (data is String) {
        // Handle the response as a plain string
        dataSave(data);
      } else {
        // Handle the case when the data is not in the expected format
        LogService.w("Error: Data is not a String");
      }
    });

  }

  dataSave(String data){
    SecureStorage.saveData({'response': data});// Storing the string in a map with a key 'response'

      Get.off(const MainScreen());
      update();

  }
}