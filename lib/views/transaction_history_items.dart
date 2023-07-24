import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warehouse_project/controllers/alter_dialog_controller.dart';
import 'package:warehouse_project/controllers/transaction_historiy_controller.dart';
import 'package:warehouse_project/model/product_model.dart';
import 'package:warehouse_project/model/transaction_history_model.dart';
import 'package:warehouse_project/utility/my_text_style.dart';

Widget itemsTransactionHistory(
    TransactionHistoryController controller,
    TransactionHistoryModel content,
    BuildContext context,
    ) {
  return GetBuilder<AlterDialogController>(
    init: AlterDialogController(),
    builder: (_controller) {
      return GestureDetector(
        // onTap: () {
        //   _controller.showItemProductAlterDialog(context, content);
        // },
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
                            child: content.productImageUrl != null
                                ? Image.network(
                              content.productImageUrl!,
                              fit: BoxFit.cover,
                            )
                                : Image.asset(
                              "assets/images/profile_pic.png",
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
                          content.productQuantityOfProduct?.toString() ?? "",
                          style: MyTextStyle.text16,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          content.productQuantityType ?? "",
                          style: MyTextStyle.text16,
                        ),
                      ],
                    ),
                  ),
                  // Expanded(
                  //   flex: 1,
                  //   child: Text(
                  //     content.d ?? "",
                  //     style: MyTextStyle.text16,
                  //   ),
                  // ),
                ],
              ),
              const Divider()
            ],
          ),
        ),
      );
    },
  );
}
