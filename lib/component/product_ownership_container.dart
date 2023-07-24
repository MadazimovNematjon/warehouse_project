import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warehouse_project/controllers/product-ownership.dart';
import 'package:warehouse_project/views/product_ownership_of_items.dart';

import '../controllers/home_controller.dart';
import '../model/product_model.dart';
import '../responsive/size_config.dart';
import '../utility/colors.dart';
import '../utility/my_text_style.dart';
import '../views/item_of_home.dart';

class ProductOwnership extends StatelessWidget {
  const ProductOwnership({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding * 0.75),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(defaultPadding),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "i have it".tr,
            style: MyTextStyle.textW600White20,
          ),
          SizedBox(
            height: SizeConfig.blockSizeVertical != null
                ? SizeConfig.blockSizeVertical! * 2
                : 0,
          ),
          Row(
            children: [
              Expanded(
                flex: 3,
                child: Text(
                  "product name".tr,
                  style: MyTextStyle.text20,
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  "quantity".tr,
                  style: MyTextStyle.text20,
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  "the date".tr,
                  style: MyTextStyle.text20,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: defaultPadding,
          ),
          GetBuilder<ProductOwnershipController>(
            init: ProductOwnershipController(),
            builder: (controller) {
              return ListView.builder(
                // scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: controller.items.length,
                itemBuilder: (context, index) {
                  Content content = controller.items[index];
                  return itemsOfProductOwnership(controller, content,context);
                },
              );
            },
          ),
          const SizedBox(
            height: defaultPadding,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {},
                child: Text("previous".tr, style: MyTextStyle.text20),
              ),
              TextButton(
                onPressed: () {},
                child: Text("next".tr, style: MyTextStyle.text20),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
