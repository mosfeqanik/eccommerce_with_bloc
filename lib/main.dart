import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/network/dio_client.dart';
import 'features/products/data/datasources/product_remote_datasource.dart';
import 'features/products/data/repositories/product_repository_impl.dart';
import 'features/products/domain/usecases/get_products.dart';
import 'features/products/presentation/bloc/product_bloc.dart';
import 'features/products/presentation/pages/products_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final dioClient = DioClient();
  final dataSource = ProductRemoteDataSource(dioClient);
  final repo = ProductRepositoryImpl(dataSource);

  runApp(MyApp(repo: repo,));
}

class MyApp extends StatelessWidget {
  final ProductRepositoryImpl repo;
  const MyApp({super.key, required this.repo});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (_) => ProductBloc(repo),
        child: const ProductsPage(),
      ),
    );
  }
}
