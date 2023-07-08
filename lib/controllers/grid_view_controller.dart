import 'package:get/get.dart';

class MyGridViewController extends GetxController {
  var crossAxisCount = 4;
  var childAspectRatio = 1.0;

  @override
  void onInit() {
    crossAxisCount = 4;
    childAspectRatio = 1.0;
    super.onInit();
  }

  updateCrossAxisCount(int count) {
    crossAxisCount = count;
    update();
  }

  updateChildAspectRatio(double aspectRatio) {
    childAspectRatio = aspectRatio;
    update();
  }
}
