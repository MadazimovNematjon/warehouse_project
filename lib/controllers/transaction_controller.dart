import 'package:get/get.dart';
import 'package:warehouse_project/model/transaction_model.dart';
import 'package:warehouse_project/model/user_model.dart';
import 'package:warehouse_project/services/log_service.dart';
import 'package:warehouse_project/services/save_secure_storage.dart';

class TransactionController extends GetxController{


  updateValue({int? id,String? senderEmail,String? reciverEmail})async {
    LogService.i(reciverEmail!);
    UserModel? user =  await SecureStorage.getData();
    final transaction = TransactionModel(
      productId: id,
      quantityOfProduct: 1,
      reciverEmail: reciverEmail,
      senderEmail: senderEmail,
    );
    update();
  }



}