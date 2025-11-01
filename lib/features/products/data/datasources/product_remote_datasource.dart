import '../../../../core/network/dio_client.dart';
import '../models/product_model.dart';

class ProductRemoteDataSource {
  final DioClient client;
  ProductRemoteDataSource(this.client);

  Future<Product> fetchProducts(int page,
      int limit) async {
    try {
      final response = await client.get(
        "/products?limit=$limit&page=$page",
      );
      Product prod = Product.fromJson(response.data);
      return prod;
    } catch (e) {
      rethrow;
    }
  }
}
