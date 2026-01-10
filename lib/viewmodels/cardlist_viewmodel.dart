import 'package:flutter/foundation.dart';
import '../models/collectible_card.dart';
import '../models/card_set.dart';
import '../services/card_service.dart';

class CardListViewModel extends ChangeNotifier {
  final CardService _cardService = CardService();
  List<CardSet> _cardSets = [];
  List<CollectibleCard> _cards = [];
  CardSet? _selectedSet;
  String? _selectedIllustrator;
  bool _isLoading = false;
  String? _errorMessage;

  List<CollectibleCard> get cards => _cards;
  List<CardSet> get cardSets => _cardSets;
  CardSet? get selectedSet => _selectedSet;
  String? get selectedIllustrator => _selectedIllustrator;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  void clearFilters() {
    _selectedSet = null;
    _selectedIllustrator = null;
    notifyListeners();
  }

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

  Future<void> loadCardSets() async {
    try {
      _cardSets = await _cardService.fetchCardSets();
    } catch (e) {
      _errorMessage = e.toString();
      notifyListeners();
    }
  }

  Future<void> loadCardsBySet(CardSet set) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _cards = await _cardService.fetchCardsBySet(set.id);
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _selectedSet = set;
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> loadCardsByIllustrator(String illustrator) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _cards = await _cardService.fetchCardsByIllustrator(illustrator);
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _selectedIllustrator = illustrator;
      _isLoading = false;
      notifyListeners();
    }
  }
}
