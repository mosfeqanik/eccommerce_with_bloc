import '../../domain/repositories/product_repository.dart';
import 'product_event.dart';
import 'product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/get_products.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:stream_transform/stream_transform.dart';
const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}


class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository repository;
  ProductBloc(this.repository) : super(ProductState()) {
    on<ProductFetched>(
      _onProductFetched,
      transformer: throttleDroppable(throttleDuration),
    );
  }
  Future<void> _onProductFetched(
      ProductFetched event,
      Emitter<ProductState> emit,
      ) async {
    try {
      if (event.isRefreshed) {
        emit(state.copyWith(
          status: ProductStatus.initial,
          page: 1,
          products: [],
        ));
      }
      final newProducts = await repository.getProducts(state.page, 10);
      emit(state.copyWith(
        status: ProductStatus.success,
        products: [...state.products, ...newProducts],
        page: state.page + 1, // increment for next fetch
      ));
    } catch (_) {
      emit(state.copyWith(status: ProductStatus.failure));
    }
  }

}
