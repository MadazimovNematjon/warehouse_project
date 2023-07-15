import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:warehouse_project/model/product_model.dart';
import 'package:warehouse_project/model/user_model.dart';
import 'package:warehouse_project/services/network_service.dart';
import 'package:warehouse_project/services/save_secure_storage.dart';

import '../services/log_service.dart';

class ProductOwnershipController extends GetxController{

  List<Content>  items = [];

  Future<List<Content>> fetchContentData() async {
    UserModel? user = await SecureStorage.getData();

    final queryParams = {
      'id': user!.id,
      // Add more query parameters as needed
    };

    final uri = Uri.parse("http://${NetworkService.BASE + NetworkService.API_OWNERSHIP}?")
        .replace(queryParameters: queryParams);

    try {
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        // If the request is successful, parse the JSON data
        final List<Content> contentList = contentFromJson(response.body);
        items = contentList;

      } else {
        // If the request fails, handle the error accordingly
        throw Exception('Failed to load content data');
      }
    } catch (e) {
      // Handle any exceptions or errors that occur during the request
      LogService.e('Error fetching content data: $e');
    }

    LogService.d("${items.length}");
    update();

    return items;
  }



}