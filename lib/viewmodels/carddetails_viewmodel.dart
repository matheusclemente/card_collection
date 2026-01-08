import 'package:card_collection/models/collectible_card.dart';
import 'package:flutter/foundation.dart';
import 'package:card_collection/services/card_service.dart';

class CardDetailsViewModel extends ChangeNotifier {
  final CardService _cardService = CardService();
  CollectibleCard? _card;
  bool _isLoading = false;
  String? _errorMessage;

  CollectibleCard? get card => _card;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> loadCardDetails(String id) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _card = await _cardService.fetchCardById(id);
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
