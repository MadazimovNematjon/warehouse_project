import 'package:get/get.dart';

class ResponsiveController extends GetxController {
  var isMobile = false;
  var isTablet = false;
  var isDesktop = false;

  void determineLayout(double screenWidth) {
    if (screenWidth >= 1100) {
      isMobile = false;
      isTablet = false;
      // LogService.e("isDesktop $isDesktop");

      isDesktop = true;
      update();
    } else if (screenWidth >= 850) {
      isMobile = false;
      isTablet = true;
      isDesktop = false;
      // LogService.e("isTablet $isTablet");
      update();
    } else {
      // LogService.e("isMobile $isMobile");

      isMobile = true;
      isTablet = false;
      isDesktop = false;
      update();
    }
  }
}
