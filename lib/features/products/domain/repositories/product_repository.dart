import '../../data/models/product_model.dart';

abstract class ProductRepository {
  Future<List<ProductElement>> getProducts(int page, int limit);
}
