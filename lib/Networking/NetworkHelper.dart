import 'dart:convert';
import 'package:MtgSearcher/Models/Card_Model.dart';
import 'package:MtgSearcher/MagicCard.dart';
import 'package:http/http.dart' as http;

import '../Endpoints/Endpoints.dart';

class NetworkHelper {
  NetworkHelper(this.url);
  final String url;

  static Future<List<MagicCard>> getData(String url) async {
    print("oi");
    final response = await http.get(Endpoints.search(url));

    if (response.statusCode == 200) {
      Map<String, dynamic> decodedData = jsonDecode(response.body);
      var cards = <MagicCard>[];
      print('ok');
      for (var card in decodedData['cards']) {
        cards.add(fromJson(card));
      }
      return cards;
    } else {
      throw Exception(response.statusCode);
    }
  }
}
