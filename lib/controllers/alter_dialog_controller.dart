import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warehouse_project/model/notification_product.dart';
import 'package:warehouse_project/model/product_model.dart';
import 'package:warehouse_project/pages/create_data_page.dart';
import 'package:warehouse_project/pages/transaction_page.dart';
import 'package:warehouse_project/utility/colors.dart';
import 'package:warehouse_project/views/item_of_product_alter_dialog.dart';
import 'package:warehouse_project/views/notification_item.dart';

class AlterDialogController extends GetxController{

  void showCreateContentDialog(BuildContext context) {
    showDialog(context: context, builder: (_) {
      return const AlertDialog(
        backgroundColor: secondaryColor,
        title: Text(
          "Upload file",
          style: TextStyle(color: Colors.white),
        ),
        content: CreateData(),
      );
    });
  }

  void showTransactionDialog(BuildContext context) {
    showDialog(context: context, builder: (_) {
      return const AlertDialog(
        backgroundColor: secondaryColor,
        title: Text(
          "Transaction",
          style: TextStyle(color: Colors.white),
        ),
        content: TransactionPage(),
      );
    });
  }

  void showItemProductAlterDialog(BuildContext context,Content content) {
    showDialog(context: context, builder: (_) {
      return  AlertDialog(
        backgroundColor: secondaryColor,
        title:  Text( content.productName!,
          style: TextStyle(color: Colors.white),
        ),
        content: itemOfProductAlterDialog(content),
      );
    });
  }

  void showItemNotificationAlterDialog(BuildContext context,NotificationProduct product) {


    showDialog(context: context, builder: (_) {
      return  AlertDialog(
        backgroundColor: secondaryColor,
        title:  Text( product.productName!,
          style: TextStyle(color: Colors.white),
        ),
        content: itemOfNotificationAlterDialog(product,context),
      );
    });
  }

}