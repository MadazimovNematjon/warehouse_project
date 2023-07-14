import 'package:get/get.dart';
import 'package:warehouse_project/services/log_service.dart';

import '../model/product_model.dart';
import '../services/network_service.dart';

class HomeController extends GetxController{
  bool dataLoaded = false;
  List<Content> items = [];

  String size = "10";
  String page = "0";


  Future fetchData() async {
  try{
    final pro = await NetworkService.fetchProductModel();
    if (pro != null) {

      final productList = List<Content>.from(pro.content!.map((json) => Content.fromJson(json.toJson())));
      items = productList;
      LogService.i(items.toString());

    }else{
    return [];
    }
  }catch(e){
      LogService.w(e.toString());
  }
  update();
  return items;
  }



}