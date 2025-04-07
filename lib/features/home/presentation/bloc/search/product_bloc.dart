import 'package:blockfirsttime/features/home/domain/entities/all_product_entites.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecases/search_all_products_usecase.dart';
import '../all_product/all_products_state.dart';
import 'all_products_event.dart';


class AllProductsBloc extends Bloc<AllProductsEvent, AllProductsState> {
  final SearchAllProductsUsecase searchAllProductsUsecase;

  AllProductsBloc(this.searchAllProductsUsecase) : super(AllProductsInitial());

  Stream<AllProductsState> mapEventToState(AllProductsEvent event) async* {
    if (event is SearchAllProductsEvent) {
      yield AllProductsLoading();
      try {
        final products = await searchAllProductsUsecase(word: event.word);
        yield AllProductsLoaded(products as List<Product>);
      } catch (e) {
        yield AllProductsError('Ошибка при поиске продуктов');
      }
    }
  }
}
