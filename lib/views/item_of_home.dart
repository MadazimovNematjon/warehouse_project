import 'package:get/get.dart';
import 'package:warehouse_project/controllers/alter_dialog_controller.dart';
import 'package:warehouse_project/utility/my_text_style.dart';

import '../controllers/home_controller.dart';
import 'package:flutter/material.dart';

import '../model/product_model.dart';

Widget itemOfHome(HomeController controller, Content content,
    BuildContext context) {
  return GetBuilder<AlterDialogController>(
    init: AlterDialogController(),
      builder: (_controller) {
    return GestureDetector(
      onTap: () {
        _controller.showItemProductAlterDialog(context,content);
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
                          child: content.image_url == null
                              ? Image.asset(
                            "assets/images/profile_pic.png",
                            fit: BoxFit.cover,
                          )
                              : Image.network(
                            content.image_url!,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 5),
                        Expanded(
                          child: Text(
                            content.productName ?? "",
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
                        content.quantity?.toString() ?? '',
                        style: MyTextStyle.text16,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        content.product_quantity_type!.tr ?? '',
                        style: MyTextStyle.text16,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    content.createDate ?? "",
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