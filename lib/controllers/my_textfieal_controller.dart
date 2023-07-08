import 'package:get/get.dart';

class MyTextFieldController extends GetxController {
  bool hidden = false;

  passwordHidden() {
    hidden = !hidden;
    print("hidden: $hidden");
    update();
  }
}