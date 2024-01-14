import 'package:flutter/material.dart';

import '../services/quote_services.dart';

class QuoteProvider extends ChangeNotifier {
  QuoteServices quoteServices = QuoteServices();

  bool isLoading = false;

  String _content = "";
  String get content => _content;

  String _author = "";
  String get author => _author;

  Future<void> randomQuote() async {
    isLoading = true;
    notifyListeners();
    final response = await quoteServices.getQuote();

    _content = response.content;
    _author = response.author;
    isLoading = false;
    notifyListeners();
  }
}
