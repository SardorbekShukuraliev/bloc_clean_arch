import 'package:blockfirsttime/features/home/domain/entities/all_products.dart';
import '../repositories/product_repository.dart';

class GetAllProductsUseCase {
  final ProductRepository repository;

  GetAllProductsUseCase(this.repository);

  Future<AllProducts> call() {
    return repository.getAllProducts();
  }
}
