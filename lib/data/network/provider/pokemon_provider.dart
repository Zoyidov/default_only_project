import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../models/pokemon_model.dart';

class PokemonApiProvider {
  static const String baseUrl = 'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json';

  Future<Pokemon> fetchPokemon() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return Pokemon.fromJson(jsonData);
    } else {
      throw Exception('Failed to fetch Pokemon');
    }
  }
}
