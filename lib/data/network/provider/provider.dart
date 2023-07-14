import '../../models/robotman_provider.dart';
import 'package:http/http.dart' as http;


class ApiProvider {
  static const String apiUrl = 'https://example.com/api';


  Future<Welcome> fetchData() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      print(response.statusCode);
      final jsonStr = response.body;
      return welcomeFromJson(jsonStr);
    } else {
      throw Exception('Failed to load data');
    }
  }
}
