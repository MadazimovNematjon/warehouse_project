import 'package:get/get.dart';
import 'package:warehouse_project/controllers/alter_dialog_controller.dart';
import 'package:warehouse_project/model/notification_product.dart';
import 'package:warehouse_project/utility/my_text_style.dart';

import '../controllers/home_controller.dart';
import 'package:flutter/material.dart';


Widget itemOfNotificationAlterDialog(NotificationProduct product,
    BuildContext context) {

  return GetBuilder<AlterDialogController>(
      init: AlterDialogController(),
      builder: (_controller) {
        return GestureDetector(
          onTap: () {
            _controller.showItemNotificationAlterDialog(context,product);
          },
          child: Container(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 3,
                      child: SizedBox(
                        width: 180,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 50,
                              height: 50,
                              child: product.productImageUrl == null
                                  ? Image.asset(
                                "assets/images/profile_pic.png",
                                fit: BoxFit.cover,
                              )
                                  : Image.network(
                                product.productImageUrl!,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 5),
                            Expanded(
                              child: Text(
                                product.productName ?? "",
                                style: MyTextStyle.text16,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Expanded(
                      flex: 2,
                      child: Row(
                        children: [
                          Text(
                            product.productQuantityOfProduct?.toString() ?? '',
                            style: MyTextStyle.text16,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            product.productQuantityType ?? '',
                            style: MyTextStyle.text16,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        product.productType ?? "",
                        style: MyTextStyle.text16,
                      ),
                    ),
                  ],
                ),
                const Divider()
              ],
            ),
          ),

        );
      });
}