import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warehouse_project/controllers/grid_view_controller.dart';
import 'package:warehouse_project/controllers/notification_controller.dart';
import 'package:warehouse_project/pages/transaction_page.dart';
import 'package:warehouse_project/services/log_service.dart';
import '../pages/create_data_page.dart';
import '../utility/colors.dart';
import '../views/gridview_button.dart';

class MyGridView extends StatelessWidget {
  var crossAxisCount;

  var childAspectRatio;

  MyGridView({this.crossAxisCount = 4, this.childAspectRatio = 1.0});


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
                  builder: (controller) {
                return gridviewButton(
                  title: "title1",
                  image: "assets/images/upload.png",
                  onPressed: () {
                    controller.notification();
                  },
                );
              }),
              gridviewButton(
                title: "title2",
                image: "assets/images/upload.png",
                onPressed: () {
                  LogService.i(controller.childAspectRatio.toString());
                },
              ),
              gridviewButton(
                title: "title3",
                image: "assets/images/upload.png",
                onPressed: () {
                  showCreateContentDialog(context);
                },
              ),
              gridviewButton(
                title: "title4",
                image: "assets/images/upload.png",
                onPressed: () {
                  showTransactionDialog(context);
                },
              ),
            ],
          );
        });
  }
}

