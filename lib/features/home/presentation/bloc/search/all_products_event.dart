abstract class AllProductsEvent {}

class SearchAllProductsEvent extends AllProductsEvent {
  final String word;

  SearchAllProductsEvent({required this.word});
}
