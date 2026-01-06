import '../models/collectible_card.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CardService {
  final String apiUrl =
      'https://api.tcgdex.net/v2/en/cards?pagination:page=1&pagination:itemsPerPage=50&image=notnull:';

  Future<List<CollectibleCard>> fetchCards() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List<dynamic> jsonList = jsonDecode(response.body) as List<dynamic>;
      return jsonList.map((json) => CollectibleCard.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load cards');
    }
  }
}
