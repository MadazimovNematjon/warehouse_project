import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:warehouse_project/controllers/notification_controller.dart';
import 'package:warehouse_project/controllers/product-ownership.dart';
import 'package:warehouse_project/controllers/transaction_historiy_controller.dart';
import 'package:warehouse_project/model/notification_product.dart';
import 'package:warehouse_project/model/product_model.dart';
import 'package:warehouse_project/pages/create_data_page.dart';
import 'package:warehouse_project/pages/transaction_page.dart';
import 'package:warehouse_project/utility/colors.dart';
import 'package:warehouse_project/views/item_of_product_alter_dialog.dart';
import 'package:warehouse_project/views/notification_item.dart';

class AlterDialogController extends GetxController {
  void showCreateContentDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) {
          return  AlertDialog(
            backgroundColor: secondaryColor,
            title: Text(
              "create product".tr,
              style: TextStyle(color: Colors.white),
            ),
            content: CreateData(),
          );
        });
  }

  void showTransactionDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) {
          return  AlertDialog(
            backgroundColor: secondaryColor,
            title: Text(
              "transaction".tr,
              style: TextStyle(color: Colors.white),
            ),
            content: TransactionPage(),
          );
        });
  }

  void showItemProductAlterDialog(BuildContext context, Content content) {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            backgroundColor: secondaryColor,
            title: Text(
              content.productName!,
              style: TextStyle(color: Colors.white),
            ),
            content: itemOfProductAlterDialog(content),
          );
        });
  }

  void showItemNotificationAlterDialog(
      BuildContext context, List<NotificationProduct> products) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          backgroundColor: secondaryColor,
          title: Text(
            "transfers".tr,
            style: TextStyle(color: Colors.white),
          ),
          content: Container(
            width: 500.w,
            height: 500.h,
            child: products.isNotEmpty
                ? SingleChildScrollView(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        return itemOfNotificationAlterDialog(
                            products[index], context);
                      },
                    ),
                  )
                : Center(
                    child: Lottie.asset("assets/animation/comp.json",height: 400),
                  ),
          ),
        );
      },
    );
  }

  void deleteProduct(int productId) {
    final notificationController = Get.find<NotificationController>();

    // Check if the product with the given id exists in the list
    final productToDelete = notificationController.items.firstWhere(
          (product) => product.id == productId,
      orElse: () => NotificationProduct(), // Return an empty instance of NotificationProduct
    );

    if (productToDelete.id != null) { // Ensure the product is not an empty instance
      // Remove the product from the items list
      notificationController.removeProduct(productToDelete);

      // Close the current dialog and immediately show the updated dialog with the new content
      final dialogContext = Get.overlayContext;
      Navigator.of(dialogContext!).pop(); // Close the current dialog
      Get.find<TransactionHistoryController>().fetchContentData();
      Get.find<ProductOwnershipController>().fetchContentData();
      // Show the updated dialog with the new content
      showItemNotificationAlterDialog(dialogContext, notificationController.items);
    }
  }



}
