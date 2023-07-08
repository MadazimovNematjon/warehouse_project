import 'package:get/get.dart';

class MyGridViewController extends GetxController {
  var crossAxisCount = 4;
  var childAspectRatio = 1.0;

  @override
  void onInit() {
    super.onInit();
    updateCrossAxisCount(4);
    updateChildAspectRatio(1.0);
  }

  void updateCrossAxisCount(int count) {
    crossAxisCount = count;
    update();
  }

  void updateChildAspectRatio(double aspectRatio) {
    childAspectRatio = aspectRatio;
    update();
  }
}
