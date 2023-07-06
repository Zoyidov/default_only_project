import '../../models/cards_model.dart';
import 'api_provider.dart';

class CardRepository {
  final ApiProvider apiProvider = ApiProvider();
  Future<List<CardsModel>> getUserCards() async {
    try {
      final cards = await apiProvider.getUserCards();
      return cards;
    } catch (e) {
      rethrow;
    }
  }
}