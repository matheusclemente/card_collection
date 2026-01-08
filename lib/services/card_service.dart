import '../models/collectible_card.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CardService {
  final String apiUrl = 'https://api.tcgdex.net/v2/en/cards';

  Future<List<CollectibleCard>> fetchCards() async {
    final response = await http.get(Uri.parse(
        '$apiUrl?sort:field=releaseDate&sort:order=ASC&pagination:page=1&pagination:itemsPerPage=60'));

    if (response.statusCode == 200) {
      List<dynamic> jsonList = jsonDecode(response.body) as List<dynamic>;
      return jsonList.map((json) => CollectibleCard.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load cards');
    }
  }

  Future<CollectibleCard> fetchCardById(String id) async {
    final response = await http.get(Uri.parse('$apiUrl/$id'));

    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      return CollectibleCard.fromJson(json);
    } else {
      throw Exception('Failed to load card with id $id');
    }
  }
}
