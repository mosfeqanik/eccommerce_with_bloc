import '../../data/models/product_model.dart';
import '../entities/product.dart';
import '../repositories/product_repository.dart';

class GetProducts {
  final ProductRepository repository;
  GetProducts(this.repository);

  Future<List<ProductElement>> call(int page, int limit) async {
    return await repository.getProducts( page,limit);
  }
}

