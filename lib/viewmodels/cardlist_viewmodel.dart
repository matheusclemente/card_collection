import 'package:flutter/foundation.dart';
import '../models/collectible_card.dart';
import '../services/card_service.dart';

class CardListViewModel extends ChangeNotifier {
  final CardService _cardService = CardService();
  List<CollectibleCard> _cards = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<CollectibleCard> get cards => _cards;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> loadCards() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _cards = await _cardService.fetchCards();
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
