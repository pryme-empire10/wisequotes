import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/quote_model.dart';


class QuoteServices {
  Future<QuoteModel> getQuote() async {
    try {
      final client = http.Client();
      final url = Uri.parse('https://api.quotable.io/quotes/random');
      final response = await client.get(url);
      if (response.statusCode == 200) {
        final body = response.body;
        final json = jsonDecode(body);
        final content = json[0]['content'];
        final author = json[0]['author'];
        return QuoteModel(
          author: author,
          content: content,
        );
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
    throw Exception("Failed to load quote");
  }
}
