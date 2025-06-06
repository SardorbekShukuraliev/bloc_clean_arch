import '../../../domain/entities/product.dart';

abstract class ProductState {}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {
  final Product product;

  ProductLoaded(this.product);
}

class ProductError extends ProductState {
  final String message;

  ProductError(this.message);
}

class AllProductsLoaded extends ProductState {
  final List<Product> products;
  AllProductsLoaded(this.products);
}


