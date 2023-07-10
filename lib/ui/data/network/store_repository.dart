import '../../models/store_model.dart';
import 'api_provider/api_product_provider.dart';

class StoreRepository {
  final ApiProvider apiProvider = ApiProvider();
  Future<List<StoreModel>> getAllProducts() async {
    try {
      final products = await apiProvider.getAllProducts();
      return products;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<StoreModel>> getLimitProducts() async {
    try {
      final products = await apiProvider.getLimitProducts(limit: 5);
      return products;
    } catch (e) {
      rethrow;
    }
  }


  Future<StoreModel> getIdProducts(int? id) async {
    try {
      final products = await apiProvider.getIdProducts(id: id!);
      return products;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<StoreModel>> sortProduct() async {
    try {
      final products = await apiProvider.getAllProducts();
      return products;
    } catch (e) {
      rethrow;
    }
  }

}