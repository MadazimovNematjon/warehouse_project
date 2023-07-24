import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:warehouse_project/services/log_service.dart';

import '../model/get_image.dart';

class FileService{

 static Future sendImageToBackup(File imageFile) async {

   var uri = Uri.parse("http://192.168.100.49:8080/attach/upload");

   var request = http.MultipartRequest('POST', uri);
    var multipartFile = await http.MultipartFile.fromPath('file', imageFile.path,
        filename: imageFile.path.split('/').last);

    request.files.add(multipartFile);

    try {
    var response = await request.send();

    if (response.statusCode == 200) {

      var jsonResponse = await response.stream.bytesToString();
      var value = json.decode(jsonResponse);

      GetIamage geturl = GetIamage.fromJson(value);
      final String downloadUrl = geturl.url.toString();

      // print('url===========: ${downloadUrl}');
      return downloadUrl;

    } else {
      // Backup failed
      // print('Image backup failed with status code ${response.statusCode}');
    }
    } catch (e) {
      // Error occurred during backup
      LogService.w(e.toString());
    }
  }

}
