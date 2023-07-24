import 'package:get/get.dart';
import 'package:warehouse_project/services/log_service.dart';
import 'package:warehouse_project/services/network_service.dart';

import '../model/product_model.dart';
import 'home_controller.dart';

class ProductController extends GetxController {
  static int page = 0;

  void nextPage() async {
    final pro = await NetworkService.fetchProductModel();
    if (pro != null) {
      LogService.d(pro.last.toString());
      if (pro.last! != true) {
        page++;
        LogService.d(page.toString());
        Get.find<HomeController>().fetchData();
      }
    }
    update();
  }

  void previousPage() {
    if (page > 0) {
      page--;
      LogService.d(page.toString());
    }
    Get.find<HomeController>().fetchData();
    update();
  }
}
