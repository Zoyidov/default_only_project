import 'dart:convert';

import 'package:http/http.dart';

import '../../models/pokemon_model.dart';

class PokemonApiProvider {
  Future getPokemon() async {
    Response response = await get(Uri.parse(
        "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json"));
    if (response.statusCode == 200) {
      return (jsonDecode(response.body)["pokemon"] as List?)
          ?.map((e) => Pokemon.fromJson(e))
          .toList() ??
          [];
    }
    throw response.body;
  }
}