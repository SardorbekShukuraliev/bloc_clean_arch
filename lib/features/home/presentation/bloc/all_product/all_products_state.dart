import '../../../domain/entities/all_product_entites.dart';

abstract class AllProductsState {}

class AllProductsInitial extends AllProductsState {}

class AllProductsLoading extends AllProductsState {}

class AllProductsLoaded extends AllProductsState {
  final List<Product> products;
  AllProductsLoaded(this.products);
}

class AllProductsError extends AllProductsState {
  final String message;
  AllProductsError(this.message);
}
