import 'dart:io';
import 'dart:developer'; // Add this import for log()
import 'dart:typed_data';
import 'package:dio/dio.dart';

class Promptrepo {
  static Future<Uint8List?> generateImage(String text) async {
    try {
      String url = 'https://api.vyro.ai/v1/imagine/api/generations';
      Map<String, dynamic> headers = {
        'Authorization': 'Bearer vk-Dr2SYuFQ9y2o40MITvXg1Egopsj8qK2pMVFM3qgAMlSEP8r'
      };

      Map<String, dynamic> payload = {
        'prompt': text, 
        'style_id': '122',
        'aspect_ratio': '1:1',
        'cfg': '5',
        'seed': '1',
        'high_res_results': '1'
      };

      FormData formdata = FormData.fromMap(payload);

      Dio dio = Dio();
      dio.options = BaseOptions(headers: headers , 
      responseType: ResponseType.bytes);

      final response = await dio.post(url, data: formdata);

      if (response.statusCode == 200) {
        return response.data;
        
      } else {
        log('API Error: Status code ${response.statusCode}');
        return null;
      }
    } catch (e) {
      log('Error in generateImage: $e');
      return null;
    }
  }
}