import 'package:get/get.dart';
import 'package:warehouse_project/controllers/create_controller.dart';
import 'package:warehouse_project/controllers/home_controller.dart';
import 'package:warehouse_project/controllers/my_textfieal_controller.dart';
import 'package:warehouse_project/controllers/product_search_controller.dart';
import 'package:warehouse_project/controllers/responsive_controller.dart';
import 'package:warehouse_project/controllers/sign_in_controller.dart';
import 'package:warehouse_project/controllers/sign_up_controller.dart';
import 'package:warehouse_project/controllers/transaction_controller.dart';
import 'package:warehouse_project/controllers/user_contoller.dart';
import '../controllers/grid_view_controller.dart';

class DIService {

  static Future<void> init() async {
    Get.lazyPut<HomeController>(() => HomeController(), fenix: true);
    Get.lazyPut<CreateController>(() => CreateController(), fenix: true);
    Get.lazyPut<MyTextFieldController>(() => MyTextFieldController(), fenix: true);
    Get.lazyPut<ResponsiveController>(() => ResponsiveController(), fenix: true);
    Get.lazyPut<MyGridViewController>(() => MyGridViewController(), fenix: true);
    Get.lazyPut<UserController>(() => UserController(), fenix: true);
    Get.lazyPut<UserController>(() => UserController(), fenix: true);
    Get.lazyPut<SignInController>(() => SignInController(), fenix: true);
    Get.lazyPut<SignUpController>(() => SignUpController(), fenix: true);
    Get.lazyPut<ProductSearchController>(() => ProductSearchController(), fenix: true);
    Get.lazyPut<TransactionController>(() => TransactionController(), fenix: true);
  }
}
