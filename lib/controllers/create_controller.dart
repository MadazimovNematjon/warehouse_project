import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:warehouse_project/controllers/notification_controller.dart';
import 'package:warehouse_project/controllers/product-ownership.dart';
import 'package:warehouse_project/controllers/transaction_historiy_controller.dart';
import 'package:warehouse_project/services/log_service.dart';
import '../model/product_model.dart';
import '../model/user_model.dart';
import '../services/file_service.dart';
import '../services/network_service.dart';
import '../services/save_secure_storage.dart';
import '../utility/utils_service.dart';
import 'home_controller.dart';

class CreateController extends GetxController {
  final ImagePicker _imagePicker = ImagePicker();
  File? saveImage;
  var items = [];
  String quantityType = "kg";
  final productNameController = TextEditingController();
  final quantityController = TextEditingController();
  final aboutController = TextEditingController();
  final priceController = TextEditingController();

  updateValue(String newValue){
    quantityType = newValue;
    update();
  }

  /// Select a picture from the gallery
  uploadImage() async {
    XFile? image = await _imagePicker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
    );

      saveImage = File(image!.path);
      update();
  }

  /// Base send function
   createNewContent() {
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
  _apiUploadProduct(String imageUrl) async {
    UserModel? user = await SecureStorage.getData();

    String name = productNameController.text.toString().trim();
    String quantity = quantityController.text.toString().trim();
    String about = aboutController.text.toString().trim();
    String price = priceController.text.toString().trim();
    update();

    print("quantity: $quantity");

    if (name.isEmpty || quantity.isEmpty || price.isEmpty) {
      // Handle if any of the fields are empty
      return;
    } else {
      print("_apiUploadProduct $imageUrl");

      Content content = Content(
        ownerProfileId: user!.id,
        productName: name,
        quantity: quantity,
        productAbout: about,
        email: user.email,
        price: price,
        image_url: imageUrl,
        product_quantity_type: quantityType,
        createDate: UtilsService.currantDate(),
      );
      _apiProduct(content);
    }
  }

  /// Function that posts the product data to the database
  void _apiProduct(Content content) async {
    await NetworkService.POST(
      NetworkService.API_CREATEPRO,
      NetworkService.paramsProduct(content),
    ).then((value) {
      debugPrint("value _apiProduct func $value");
      clearPage(value.toString());
    });
  }

  /// Function that clears the page after data is posted
   clearPage(String value) {
    productNameController.clear();
    aboutController.clear();
    priceController.clear();
    quantityController.clear();
    updateData();
    Get.back();
    update();
   }

 void updateData(){
      Get.find<HomeController>().fetchData();
      Get.find<ProductOwnershipController>().fetchContentData();
      Get.find<TransactionHistoryController>().fetchContentData();
      update();
   }
}
