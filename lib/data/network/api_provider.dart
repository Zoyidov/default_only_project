import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../models/cards_model.dart';

class ApiProvider {
  Future<List<CardsModel>> getUserCards() async {
    final url = Uri.parse('https://banking-api.free.mockoapp.net/user_cards');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as List<dynamic>;
      final List<CardsModel> cards = data.map((cardJson) {
        return CardsModel.fromJson(cardJson);
      }).toList();
      return cards;
    } else {
      throw Exception('Failed to load user cards');
    }
  }
}
