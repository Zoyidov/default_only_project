import '../../model/currency_model.dart';
import '../../model/universal_response.dart';
import 'api_provider.dart';

class CurrencyRepository {
  final ApiProvider apiProvider;

  CurrencyRepository({required this.apiProvider});

  Future<List<CurrencyModel>> fetchCurrencies() async {
    UniversalResponse universalResponse = await apiProvider.getAllCurrencies();
    if (universalResponse.error.isEmpty) {
      return universalResponse.data as List<CurrencyModel>;
    }
    return [];
  }
}