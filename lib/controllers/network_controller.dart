import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warehouse_project/utility/my_text_style.dart';


class NetworkController extends GetxController {
  final Connectivity _connectivity = Connectivity();

  @override
  void onInit() {
    super.onInit();

    _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    if(result == ConnectivityResult.none){
      Get.rawSnackbar(
        messageText: Text("Please connect to the internet",style: MyTextStyle.textWhite16,),
        isDismissible: false,
        duration: Duration(seconds: 10),
        backgroundColor: Colors.red,
        icon: Icon(Icons.wifi_find,color: Colors.white,),

          margin: EdgeInsets.zero,
          snackStyle: SnackStyle.GROUNDED
      );
    }
    update();
  }

  // Future<void> performPing() async {
  //   String ipAddress = '192.168.100.100';
  //
  //   final ping = Ping(ipAddress);
  //   ping.stream.listen((event) {
  //    LogService.w("$event");
  //   });
  //
  // }

}