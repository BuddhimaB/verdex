import 'package:flutter/material.dart';

class SearchProvider extends ChangeNotifier {
  final List<String> _recentSearches = ['Spider Plant', 'Song of India'];
  List<String> get recentSearches => _recentSearches;

  void removeSearch(String term) {
    _recentSearches.remove(term);
    notifyListeners();
  }

  void addSearch(String term) {
    if (!_recentSearches.contains(term)) {
      _recentSearches.insert(0, term);
      notifyListeners();
    }
  }
}
