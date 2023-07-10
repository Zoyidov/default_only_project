import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:login_screen_homework/ui/models/store_model.dart';

class ApiProvider {

  //<<<<<<<<<<<<<<<<<<<getAllProduct>>>>>>>>>>>>>>>>>>>//

  Future<List<StoreModel>> getAllProducts() async {
    final url = Uri.parse('https://fakestoreapi.com/products');

    final response = await http.get(url);

    if (response.statusCode == 200) {

      final data = jsonDecode(response.body) as List<dynamic>;
      final List<StoreModel> cards = data.map((cardJson) {
        return StoreModel.fromJson(cardJson);
      }).toList();
      return cards;
    } else {
      throw Exception('Failed to load the products');
    }
  }

  //<<<<<<<<<<<<<<<<<<<getLimitProduct>>>>>>>>>>>>>>>>>>>//


  Future<List<StoreModel>> getLimitProducts({required int limit}) async {
    final url = Uri.parse('https://fakestoreapi.com/products?limit=$limit');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as List<dynamic>;
      final List<StoreModel> cards = data.map((cardJson) {
        return StoreModel.fromJson(cardJson);
      }).toList();
      return cards;
    } else {
      throw Exception('Failed to load some products');
    }
  }


  //<<<<<<<<<<<<<<<<<<<getIdProduct>>>>>>>>>>>>>>>>>>>//


  Future<StoreModel> getIdProducts({required int id}) async {
    final url = Uri.parse('https://fakestoreapi.com/products/$id');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) ;

        return StoreModel.fromJson(data);
    } else {
      throw Exception('Failed to load product');
    }
  }


  //<<<<<<<<<<<<<<<<<<<sortProduct>>>>>>>>>>>>>>>>>>>//



  Future<List<StoreModel>> sortProduct() async {
    final url = Uri.parse('https://fakestoreapi.com/products?sort=desc');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as List<dynamic>;
      final List<StoreModel> cards = data.map((cardJson) {
        return StoreModel.fromJson(cardJson);
      }).toList();
      return cards;
    } else {
      throw Exception('Failed to load some products');
    }
  }


  //<<<<<<<<<<<<<<<<<<<deleteProduct>>>>>>>>>>>>>>>>>>>//



  static Future<StoreModel?>? deletePost() async {
    final uri = Uri.parse("https://fakestoreapi.com/products");
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      return null;
    } else {
      throw Exception("Failed to load post ");
    }
  }

}
