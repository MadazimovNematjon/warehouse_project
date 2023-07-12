import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController {

  final String title = "";
  final String message = "";

  notification() {
    return Get.snackbar(title, message,
        duration: Duration(seconds: 100),
        mainButton: TextButton(onPressed: () {}, child: Text("asd")));
  }
}
