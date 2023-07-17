import 'dart:convert';
import 'package:http/http.dart' as http;

class TranslationProvider {
  Future<String> getTranslation(String query) async {
    final url = Uri.parse('https://api.mymemory.translated.net/get?q=$query&langpair=en|uz');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final translatedText = jsonData['responseData']['translatedText'];
      return translatedText;
    } else {
      throw Exception('Failed translation');
    }
  }
}
