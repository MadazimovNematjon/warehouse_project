import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:warehouse_project/controllers/acceptance%20_controller.dart';
import 'package:warehouse_project/component/on_hover_effect.dart';
import 'package:warehouse_project/controllers/alter_dialog_controller.dart';
import 'package:warehouse_project/controllers/notification_controller.dart';
import 'package:warehouse_project/model/notification_product.dart';
import 'package:warehouse_project/utility/colors.dart';
import 'package:warehouse_project/utility/my_text_style.dart';

import '../controllers/home_controller.dart';
import 'package:flutter/material.dart';


Widget itemOfNotificationAlterDialog(NotificationProduct product,BuildContext context) {
  return GetBuilder<AlterDialogController>(
      init: AlterDialogController(),
      builder: (_controller) {
        return Container(
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
                              width: 100,
                              height: 100,
                              child: product.productImageUrl == null
                                  ? Image.asset(
                                "assets/images/profile_pic.png",
                                fit: BoxFit.contain,
                              )
                                  : Image.network(
                                product.productImageUrl!,
                                fit: BoxFit.contain,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  Row(
                                    children: [
                                      Text(
                                        "product name".tr,
                                        style: MyTextStyle.text16,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),

                                      SizedBox(width: 5,),

                                      Text(
                                        product.productName ??
                                            "",
                                        style: MyTextStyle.textWhite16,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),

                                  const SizedBox(height: 5,),

                                  Row(
                                    children: [
                                      Text( "product quantity".tr,
                                        style: MyTextStyle.text16,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,),

                                      SizedBox(width: 5,),

                                      Text(
                                        "${product
                                            .productQuantityType} ${product
                                            .productQuantityType}" ?? "",
                                        style: MyTextStyle.text16,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),

                                  const SizedBox(height: 5,),

                                 Row(
                                   children: [
                                     Text(
                                       "sender".tr,
                                       style: MyTextStyle.text16,
                                       maxLines: 2,
                                       overflow: TextOverflow.ellipsis,
                                     ),

                                     SizedBox(width: 5,),

                                     Text(
                                       "${product.senderEmail}" ?? "",
                                       style: MyTextStyle.text16,
                                       maxLines: 2,
                                       overflow: TextOverflow.ellipsis,
                                     ),

                                   ],
                                 ),

                                  const SizedBox(height: 5,),

                                  Row(
                                    children: [
                                      Text(
                                        "receiver".tr,
                                        style: MyTextStyle.text16,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),

                                      SizedBox(width: 5,),

                                      Text(
                                        "${product.resvierEmail}" ?? "",
                                        style: MyTextStyle.text16,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),

                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                GetBuilder<AcceptanceController>(
                    init: AcceptanceController(),
                    builder: (controller) {
                      return Row(
                        children: [
                          HoverButton(title: "refusal".tr,
                              onPressed: () {
                                controller.acceptanceUpload(false, product.id!);
                                _controller.deleteProduct(product.id!);
                              },
                              color: secondaryColor),
                          HoverButton(title: "acceptance".tr,
                              onPressed: () {
                                controller.acceptanceUpload(true, product.id!);
                                _controller.deleteProduct(product.id!);
                              },
                              color: primaryColor),

                        ],
                      );
                    }),

                const Divider(),

              ],
            )
        );
      });
}