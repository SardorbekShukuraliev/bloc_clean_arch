import 'package:blockfirsttime/features/home/domain/entities/all_products.dart';
import 'package:blockfirsttime/features/home/domain/entities/categories.dart';
import '../../data/datasources/product_remote_data_source.dart';
import '../../domain/repositories/product_repository.dart' show ProductRepository;

import '../entities/product.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;

  ProductRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Product> getSingleProduct({required int id}) {
    return remoteDataSource.getSingleProduct(id: id);
  }

  @override
  Future<AllProducts> getAllProducts() {
    return remoteDataSource.getAllProducts();
  }

  // Future<AllProducts> searchProducts({required String word}) {
  //   return remoteDataSource.searchProducts(word: word);
  // }
  //
  // Future<AllProducts> sortProducts({
  //   required String sortName,
  //   required String ascDesc,
  // }) {
  //   return remoteDataSource.sortProducts(sortName: sortName, ascDesc: ascDesc);
  // }

  @override
  Future<List<Category>> getCategories() {
    // TODO: implement getCategories
    throw UnimplementedError();
  }

  @override
  Future<AllProducts> getProductsByCategory({required String url}) {
    // TODO: implement getProductsByCategory
    throw UnimplementedError();
  }

  @override
  Future<AllProducts> searchAllProducts({required String word}) {
    // TODO: implement searchAllProducts
    throw UnimplementedError();
  }

  @override
  Future<AllProducts> sortAllProducts({required String sortName, required String ascDesc}) {
    // TODO: implement sortAllProducts
    throw UnimplementedError();
  }
}
