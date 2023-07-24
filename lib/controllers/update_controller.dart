import 'package:get/get.dart';
import 'package:warehouse_project/controllers/home_controller.dart';
import 'package:warehouse_project/controllers/notification_controller.dart';
import 'package:warehouse_project/controllers/product-ownership.dart';
import 'package:warehouse_project/controllers/transaction_controller.dart';
import 'package:warehouse_project/controllers/transaction_historiy_controller.dart';

class UpdateController extends GetxController{

  void  upData(){
    Get.find<HomeController>().fetchData();
    Get.find<NotificationController>().sendEmail();
    Get.find<TransactionHistoryController>().fetchContentData();
    Get.find<ProductOwnershipController>().fetchContentData();
    update();
  }

}