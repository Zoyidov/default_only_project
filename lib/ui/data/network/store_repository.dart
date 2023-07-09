import '../../models/store_model.dart';
import 'api_provider/api_product_provider.dart';

class StoreRepository {
  final ApiProvider apiProvider = ApiProvider();
  Future<List<StoreModel>> getAllProduct() async {
    try {
      final products = await apiProvider.getAllProduct();
      return products;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<StoreModel>> getLimitProduct() async {
    try {
      final products = await apiProvider.getLimitProduct(limit: 5);
      return products;
    } catch (e) {
      rethrow;
    }
  }


  Future<StoreModel> getIdProduct(int? id) async {
    try {
      final products = await apiProvider.getIdProduct(id: id!);
      return products;
    } catch (e) {
      rethrow;
    }
  }
}