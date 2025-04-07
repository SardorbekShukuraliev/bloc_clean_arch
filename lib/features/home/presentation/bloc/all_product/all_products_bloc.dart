// lib/features/home/presentation/bloc/all_product/all_products_bloc.dart
import 'package:bloc/bloc.dart';
import 'package:blockfirsttime/features/home/domain/entities/all_product_entites.dart';
import 'package:blockfirsttime/features/home/domain/usecases/get_all_products_usecase.dart';
import 'all_products_event.dart';
import 'all_products_state.dart';

class AllProductsBloc extends Bloc<AllProductsEvent, AllProductsState> {
  final GetAllProductsUseCase getAllProductsUseCase;

  AllProductsBloc(this.getAllProductsUseCase) : super(AllProductsInitial()) {
    on<FetchAllProductsEvent>((event, emit) async {
      emit(AllProductsLoading());
      try {
        final products = await getAllProductsUseCase();
        emit(AllProductsLoaded(products as List<Product>));
      } catch (e) {
        emit(AllProductsError('Ошибка загрузки данных: $e'));
      }
    });
  }
}
