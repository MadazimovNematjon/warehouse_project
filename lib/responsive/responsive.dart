import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/responsive_controller.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileScaffold;
  final Widget tabletScaffold;
  final Widget desktopScaffold;

  ResponsiveLayout({
    required this.mobileScaffold,
    required this.tabletScaffold,
    required this.desktopScaffold,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ResponsiveController>(
      init: ResponsiveController(),
        builder: (controller) {
        if (controller.isDesktop) {
          // print("");
          // LogService.i("desktop $desktopScaffold");
          return desktopScaffold;
        } else if (controller.isTablet) {
         // print("tab");
         // LogService.i("tab $tabletScaffold");
         return tabletScaffold;
        } else {
          // print("mobile");
          // LogService.i("mobile $mobileScaffold");
          return mobileScaffold;
        }
      });
  }
}
