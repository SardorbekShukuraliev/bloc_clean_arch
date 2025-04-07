import '/features/home/domain/usecases/product_usecase.dart';
import '/features/home/domain/usecases/get_all_products_usecase.dart';
import 'product_event.dart';
import 'product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductUseCase productUseCase;
  final GetAllProductsUseCase getProductsUseCase;

  ProductBloc({
    required this.productUseCase,
    required this.getProductsUseCase,
  }) : super(ProductInitial()) {
    on<GetAllProductsEvent>((event, emit) async {
      emit(ProductLoading());
      try {
        final allProducts = await getProductsUseCase();
        emit(AllProductsLoaded(allProducts.products));
      } catch (e) {
        emit(ProductError(e.toString()));
      }
    });
  }
}
