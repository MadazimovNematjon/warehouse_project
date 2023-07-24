import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warehouse_project/controllers/alter_dialog_controller.dart';
import 'package:warehouse_project/controllers/grid_view_controller.dart';
import 'package:warehouse_project/controllers/notification_controller.dart';
import 'package:warehouse_project/model/notification_product.dart';
import 'package:warehouse_project/services/log_service.dart';
import '../utility/colors.dart';
import '../views/gridview_button.dart';

class MyGridView extends StatelessWidget {
  var crossAxisCount;

  var childAspectRatio;

  MyGridView({this.crossAxisCount = 4, this.childAspectRatio = 1.0});


  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyGridViewController>(
        init: MyGridViewController(),
        builder: (controller) {
          return GridView(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: controller.crossAxisCount,
              crossAxisSpacing: defaultPadding,
              mainAxisSpacing: defaultPadding,
              childAspectRatio: controller.childAspectRatio,
            ),
            children: [


              GetBuilder<NotificationController>(
                init: NotificationController(),
                builder: (notificationController) {
                  return gridviewButton(
                    title: "transfers".tr,
                    image: "assets/images/transfers.png",
                    onPressed: () async {
                      await notificationController.sendEmail();
                      final alter = Get.find<AlterDialogController>();
                      alter.showItemNotificationAlterDialog(
                        context,
                        notificationController.items,
                      );
                      // Handle case when there are no notification items

                    },
                  );
                }),



              GetBuilder<AlterDialogController>(
                init: AlterDialogController(),
                  builder: (controller) {
                return gridviewButton(
                  title: "chat".tr,
                  image: "assets/images/chat.png",
                  onPressed: () {

                  },
                );
              }),
              GetBuilder<AlterDialogController>(
                  init: AlterDialogController(),
                  builder: (controller) {
                    return gridviewButton(
                      title: "create product".tr,
                      image: "assets/images/create.png",
                      onPressed: () {
                        controller.showCreateContentDialog(context);
                      },
                    );
                  }),
              GetBuilder<AlterDialogController>(
                  init: AlterDialogController(),
                  builder: (controller) {
                    return gridviewButton(
                      title: "transaction".tr,
                      image: "assets/images/transaction.png",
                      onPressed: () {
                        controller.showTransactionDialog(context);
                      },
                    );
                  }),
            ],
          );
        });
  }
}

