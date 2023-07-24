import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:warehouse_project/model/notification_product.dart';
import 'package:warehouse_project/model/user_model.dart';
import 'package:warehouse_project/services/log_service.dart';
import 'package:warehouse_project/services/network_service.dart';
import 'package:warehouse_project/services/save_secure_storage.dart';

class NotificationController extends GetxController {
  final String title = "";
  final String message = "";

  List<NotificationProduct> items = [];

  Future<void> sendEmail() async {
    UserModel? user = await SecureStorage.getData();

    final queryParams = {
      'reciverEmail': user!.email,
      // Add more query parameters as needed
    };

    final uri = Uri.parse("http://${NetworkService.BASE + NetworkService.API_NOTIFYTRANSACTION}?")
        .replace(queryParameters: queryParams);

    LogService.w(uri.toString());

    try {
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        // Request successful
        final notificationProducts = notificationProductFromJson(response.body);
        items = notificationProducts;
        LogService.d("Response: ${items}");
      } else {
        // Request failed
        LogService.e('Request failed with status: ${response.statusCode}');
      }
    } catch (error) {
      // Handle any error that occurred during the request
      LogService.e("Error: $error");
    }

    update();
  }

  void removeProduct(NotificationProduct product) {
    items.remove(product);

    // Print a debug message
    print("Removed product with id: ${product.id}");

    // Update the UI with the new list of products
    update();
  }

}
