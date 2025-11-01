import '../../data/models/product_model.dart';
import '../../domain/entities/product.dart';
import 'product_bloc.dart';
enum ProductStatus { loading, success, empty ,error}

class ProductState {
  const ProductState( {
    this.status = ProductStatus.loading,
    this.products = const <ProductElement>[],
    this.page = 1,
  });
  final ProductStatus status;
  final List<ProductElement> products;
  final int page;

  ProductState copyWith({
    ProductStatus? status,
    List<ProductElement>? products,
    int? page,
    bool? hasReachedMax,
  }) {
    return ProductState(
      status: status ?? this.status,
      products: products ?? this.products,
      page: page ?? this.page,
    );
  }

  @override
  String toString() {
    return '''PostState { status: $status, posts: ${products.length} }''';
  }

  List<Object> get props => [status, products,];
}
