import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/prayer_model.dart';

class PrayerProvider{
  Future<PrayerModel?> getPrayerModel()async{
    Uri uri = Uri.parse("https://islomapi.uz/api/present/day?region=Toshkent");
    http.Response response = await http.get(uri);
    if(response.statusCode==200){
      return PrayerModel.fromJson(jsonDecode(response.body));
    }
    throw Exception("Error");
  }
}