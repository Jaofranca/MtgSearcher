import 'dart:convert';
import 'package:dio/dio.dart';

class NetworkHelper {
  NetworkHelper(this.url);
  final String url;

  Future getData() async {
    print('1');
    var dio = Dio();
    try {
      print("2");
      Response response = await dio.get(url);
      String data = response.data;
      print(data);
      return jsonDecode(data);
    } catch (e) {
      print(e);
    }
  }
}
