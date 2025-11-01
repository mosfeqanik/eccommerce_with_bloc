import 'package:equatable/equatable.dart';
import 'product_bloc.dart';
import 'package:equatable/equatable.dart';
abstract class ProductEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ProductFetched extends ProductEvent {
  final bool isRefreshed;
  ProductFetched(this.isRefreshed);
}
