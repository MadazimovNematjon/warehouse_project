import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:warehouse_project/model/user_model.dart';
import 'package:warehouse_project/pages/user_page.dart';
import 'package:warehouse_project/services/file_service.dart';
import 'package:warehouse_project/services/save_secure_storage.dart';

class UserController extends GetxController{
 UserModel? user;

  final ImagePicker _imagePicker = ImagePicker();
  File? saveImage;
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final cityController = TextEditingController();
  final phoneController = TextEditingController();

  bool hidden = false;


  @override
  void onInit() {
    super.onInit();
    userData();
  }

  uploadImage() async {
    XFile? image = await _imagePicker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
    );

    saveImage = File(image!.path);
    update();
  }

  /// Base send function
  void createNeupwContent() {
    if (saveImage == null) {
      // Handle if no image is selected
      return;
    }
    apiPhotoChange();
  }

  /// A function that sends an image to the database and receives the image URL
  void apiPhotoChange() async {
    if (saveImage == null) {
      print("RASM YO'Q");
      return;
    }

    await FileService.sendImageToBackup(saveImage!).then((imageUrl) {
      debugPrint("_apiPhotoChange $imageUrl");
      _apiUploadProduct(imageUrl);
    });
  }

  /// Function that handles uploading the product data to the database
  void _apiUploadProduct(String imageUrl) async {

    String firstName = firstNameController.text.toString().trim();
    String lastname = lastNameController.text.toString().trim();
    String email = emailController.text.toString().trim();
    String city = cityController.text.toString().trim();
    String phone = phoneController.text.toString().trim();
    update();
  }


  editUserInfo(){
    hidden = !hidden;
        update();
  }


  saveUserInfo(){
    hidden = !hidden;
    update();
  }

 void openAccount(){
    Get.off(()=>UserPage(),transition: Transition.upToDown,duration: Duration(seconds: 2));
    update();
  }

  Future<void> userData() async {
    user = await SecureStorage.getData();
    update();
  }


}