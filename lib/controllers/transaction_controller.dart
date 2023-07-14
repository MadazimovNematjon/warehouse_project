import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_email_sender/simple_email_sender.dart';
import 'package:warehouse_project/model/transaction_model.dart';
import 'package:warehouse_project/model/user_model.dart';
import 'package:warehouse_project/services/log_service.dart';
import 'package:warehouse_project/services/network_service.dart';
import 'package:warehouse_project/services/save_secure_storage.dart';

class TransactionController extends GetxController {

  int? productId;
  String? reciverEmail;


  void upDateId(int id){
    productId = id;
    update();
  }

  void upDateReciver(String email){
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
        quantityOfProduct: 1,
        reciverEmail: reciverEmail,
        senderEmail: "nadir@gmail.com",
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
              LogService.w(value!)
            });
        LogService.d(" params ${transaction.toString()}");
      }
    }
    update();
    Get.back();
  }



}
