import 'package:get/get.dart';

import '../services/network_service.dart';

class HomeController extends GetxController{
  var dataLoaded = false;
  var items = [];

  String size = "10";
  String page = "0";

  Future<void> getData() async {
    try {
      if(items.isNotEmpty) {
        items = await NetworkService.fetchData();
        dataLoaded = true;
      }else{
        items = [];
      }
      update();

    } catch (e) {
      print("bo'sh");
    }
  }
}