abstract class ProductEvent {
  const ProductEvent();
}

class FetchProduct extends ProductEvent {
  final int id;

  const FetchProduct({required this.id});
}

class GetAllProductsEvent extends ProductEvent {}
