import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:warehouse_project/model/user_model.dart';
import 'package:warehouse_project/pages/main_screen_page.dart';
import 'package:warehouse_project/services/log_service.dart';
import 'package:warehouse_project/services/network_service.dart';


class SignInController extends GetxController{

  final gmailController = TextEditingController();
  final passwordController = TextEditingController();


 Future<void> doSignIn() async {
    String gmail = gmailController.text.toString().trim();
    String password = passwordController.text.toString().trim();

    if (gmail.isEmpty || password.isEmpty) return;

    var member = UserModel(email: gmail, password: password);

    await NetworkService.POST(
        NetworkService.API_SIGNIN, NetworkService.paramsAuth(member))
        .then((data) => getValue(data!));
  }


  void getValue(dynamic data) {
    if(data != null){
     LogService.i(data);
      Get.off(const MainScreen());
    }
  }

 void next(){
    Get.off(()=>MainScreen(),transition: Transition.downToUp,duration: Duration(seconds: 2));
   update();
  }

}