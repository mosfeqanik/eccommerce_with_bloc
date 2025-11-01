import '../../domain/entities/product.dart';
import '../../domain/repositories/product_repository.dart';
import '../datasources/product_remote_datasource.dart';
import '../models/product_model.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remote;
  ProductRepositoryImpl(this.remote);

  @override
  Future<List<ProductElement>> getProducts(int page, int limit) async {
    final productResponse = await remote.fetchProducts( page, limit);
    return productResponse.products ?? [];
  }
}
