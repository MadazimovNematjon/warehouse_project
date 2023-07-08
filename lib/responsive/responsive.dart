// //
// // import 'package:flutter/material.dart';
// //
// // class ResponsiveLayout extends StatelessWidget{
// //   final Widget mobileScaffold;
// //   final Widget tabletScaffold;
// //   final Widget desktopScaffold;
// //
// //   const ResponsiveLayout({super.key, required this.mobileScaffold, required this.tabletScaffold, required this.desktopScaffold});
// //
// //   static bool isMobile(BuildContext context) =>
// //       MediaQuery.of(context).size.width < 850;
// //   static bool isTablet(BuildContext context) =>
// //       MediaQuery.of(context).size.width < 1100 &&
// //           MediaQuery.of(context).size.width >= 850;
// //
// //   static bool isDesktop(BuildContext context) =>
// //       MediaQuery.of(context).size.width >= 1100;
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     final Size _size = MediaQuery.of(context).size;
// //     // If our width is more than 1100 then we consider it a desktop
// //     if (_size.width >= 1100) {
// //       print("desktop");
// //       return desktopScaffold;
// //
// //     }
// //     // If width it less then 1100 and more then 850 we consider it as tablet
// //     else if (_size.width >= 850) {
// //       print("tab");
// //       return tabletScaffold;
// //     }
// //     // Or less then that we called it mobile
// //     else {
// //       print("mobile");
// //       return mobileScaffold;
// //     }
// //   }
// //
// // }
//
//
//
//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../controllers/responsive_controller.dart';
//
// class ResponsiveLayout extends GetView<ResponsiveController> {
//   final Widget mobileScaffold;
//   final Widget tabletScaffold;
//   final Widget desktopScaffold;
//
//   ResponsiveLayout({
//     required this.mobileScaffold,
//     required this.tabletScaffold,
//     required this.desktopScaffold,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Obx(() {
//       final bool isMobile = controller.isMobile.value;
//       final bool isTablet = controller.isTablet.value;
//       final bool isDesktop = controller.isDesktop.value;
//
//       if (isDesktop) {
//         print("desktop");
//         return desktopScaffold;
//       } else if (isTablet) {
//         print("tab");
//         return tabletScaffold;
//       } else {
//         print("mobile");
//         return mobileScaffold;
//       }
//     });
//   }
// }


import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/responsive_controller.dart';
import '../services/log_service.dart';

class ResponsiveLayout extends GetWidget<ResponsiveController>{
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
          print("");
          LogService.i("desktop $desktopScaffold");
          return desktopScaffold;
        } else if (controller.isTablet) {
         print("tab");
         LogService.i("tab $tabletScaffold");
         return tabletScaffold;
        } else {
          print("mobile");
          LogService.i("mobile $mobileScaffold");
          return mobileScaffold;
        }
      });
  }
}
