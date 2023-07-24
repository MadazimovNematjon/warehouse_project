import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:warehouse_project/model/product_model.dart';
import 'package:warehouse_project/model/transaction_history_model.dart';
import 'package:warehouse_project/model/user_model.dart';
import 'package:warehouse_project/services/network_service.dart';
import 'package:warehouse_project/services/save_secure_storage.dart';

import '../services/log_service.dart';

class TransactionHistoryController extends GetxController{
  // http://192.168.20.49:8080/transaction/transactionHistory?profileEmail=nmadazimov734%40gmail.com
  List<TransactionHistoryModel>  items = [];

  Future<List<TransactionHistoryModel>> fetchContentData() async {
    UserModel? user = await SecureStorage.getData();

    LogService.w(user!.email.toString());
    final queryParams = {
      'profileEmail': user!.email,
      // Add more query parameters as needed
    };

    final uri = Uri.parse("http://${NetworkService.BASE + NetworkService.API_TRANS_HISTORY}")
        .replace(queryParameters: queryParams);

    try {
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        // If the request is successful, parse the JSON data
        final List<TransactionHistoryModel> contentList = transactionHistoryModelFromJson(response.body);
        items = contentList;
        LogService.d(items.first.productName.toString());
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