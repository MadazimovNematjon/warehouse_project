import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warehouse_project/controllers/home_controller.dart';
import 'package:warehouse_project/controllers/product-ownership.dart';
import 'package:warehouse_project/model/transaction_model.dart';
import 'package:warehouse_project/model/user_model.dart';
import 'package:warehouse_project/services/log_service.dart';
import 'package:warehouse_project/services/network_service.dart';
import 'package:warehouse_project/services/save_secure_storage.dart';

class TransactionController extends GetxController {
  int? productId;
  String? reciverEmail;
String? quantityOfProduct;

final input = TextEditingController();

  void upDateId(int id) {
    productId = id;
    update();
  }


  void upDatequantityOfProduct() {
    quantityOfProduct = input.text.toString();
    update();
  }


  void upDateReciver(String email) {
    reciverEmail = email;
    update();
  }


  updateValue() async {
    if (productId != null && reciverEmail != null) {
      LogService.i(reciverEmail.toString());
      LogService.i(productId.toString());
      UserModel? user = await SecureStorage.getData();

      var transaction = TransactionModel(
        productId: productId,
        quantityOfProduct: input.text.toString(),
        reciverEmail: reciverEmail,
        senderEmail: user!.email,
      );

      print("object");
      if (transaction.reciverEmail != null &&
          transaction.productId != null &&
          transaction.senderEmail != null &&
          transaction.quantityOfProduct != null) {
// LogService.w("${transaction.reciverEmail}  ${transaction.productId}  ${transaction.senderEmail}  ${transaction.quantityOfProduct}");
        await NetworkService.POST(NetworkService.API_TRANSACTION,
                NetworkService.paramsTransaction(transaction))
            .then((value) => {
                  Get.find<HomeController>().fetchData(),
                  Get.find<ProductOwnershipController>().fetchContentData(),
                  LogService.w(value!)
                });
        LogService.d(" params ${transaction.quantityOfProduct.toString()}");
      }
    }
    update();
    Get.back();
  }
}
