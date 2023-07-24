import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warehouse_project/controllers/responsive_controller.dart';
import '../responsive/responsive.dart';
import '../utility/colors.dart';
import '../utility/my_text_style.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ResponsiveController>(
      init: ResponsiveController(),
        builder: (controller) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (controller.isDesktop)
            Text(
              "home page".tr,
              style: MyTextStyle.textW600White20,
            ),
          Spacer(
            flex: controller.isDesktop ? 2 : 1,
          ),
          Expanded(
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(defaultPadding / 1.5),
                color: secondaryColor,
              ),
              child:  Center(
                child: TextField(
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(10),
                      hintText: "search".tr,
                      hintStyle: const TextStyle(color: Colors.grey),
                      border: InputBorder.none,
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Colors.grey,
                      )),
                ),
              ),
            ),
          )
        ],
      );
    });
  }
}
