import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/card_set.dart';
import '../models/collectible_card.dart';

class CardService {
  final String baseApiUrl = 'https://api.tcgdex.net/v2/en';

  Future<List<CollectibleCard>> fetchCards() async {
    final response = await http.get(Uri.parse(
        '$baseApiUrl/cards?sort:field=set&sort:order=DSC&pagination:page=1&pagination:itemsPerPage=60'));

    if (response.statusCode == 200) {
      List<dynamic> jsonList = jsonDecode(response.body) as List<dynamic>;
      return jsonList.map((json) => CollectibleCard.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load cards');
    }
  }

  Future<CollectibleCard> fetchCardById(String id) async {
    final response = await http.get(Uri.parse('$baseApiUrl/cards/$id'));

    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      return CollectibleCard.fromJson(json);
    } else {
      throw Exception('Failed to load card with id $id');
    }
  }

  Future<List<CardSet>> fetchCardSets() async {
    final response = await http.get(
        Uri.parse('$baseApiUrl/sets?sort:order=DESC&sort:field=releaseDate'));

    if (response.statusCode == 200) {
      List<dynamic> jsonList = jsonDecode(response.body) as List<dynamic>;
      return jsonList.map((json) => CardSet.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load card sets');
    }
  }

  Future<List<CollectibleCard>> fetchCardsBySet(String setId) async {
    final response = await http.get(Uri.parse(
        '$baseApiUrl/cards?set=$setId&pagination:page=1&pagination:itemsPerPage=60'));

    if (response.statusCode == 200) {
      List<dynamic> jsonList = jsonDecode(response.body) as List<dynamic>;
      return jsonList.map((json) => CollectibleCard.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load cards for set $setId');
    }
  }
}
