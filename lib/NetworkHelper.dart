import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper(this.url);
  final String url;

  Future getData() async {
    http.Response response = await http.get(url);
    print("eita");
    if (response.statusCode == 200) {
      String data = response.body;
      print("deu bom");
      return jsonDecode(data);
    } else {
      print(response.statusCode);
      print("deu certo n");
    }
  }
}
