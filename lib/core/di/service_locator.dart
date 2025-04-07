import '/features/home/data/datasources/product_remote_data_source.dart';
import '/features/home/data/repositories/product_repository_impl.dart';
import '/features/home/domain/repositories/product_repository.dart';
import '/features/home/domain/usecases/product_usecase.dart';
import '/features/home/domain/usecases/get_all_products_usecase.dart';
import '../../features/home/presentation/bloc/single_product/product_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> setup() async {
  sl.registerLazySingleton<Dio>(() => Dio());

  sl.registerLazySingleton<ProductRemoteDataSource>(
        () => ProductRemoteDataSourceImpl(dio: sl()),
  );

  sl.registerLazySingleton<ProductRepository>(
        () => ProductRepositoryImpl(sl()),
  );

  sl.registerLazySingleton<ProductUseCase>(() => ProductUseCase(sl()));
  sl.registerLazySingleton<GetAllProductsUseCase>(
        () => GetAllProductsUseCase(sl()),
 );

  sl.registerFactory<ProductBloc>(
        () => ProductBloc(
      productUseCase: sl(),
      getProductsUseCase: sl(),
    ),
  );
}

// final sl = GetIt.instance;
//
// Future<void> setUp() async {
//   sl.registerLazySingleton(() => Dio());
//   sl.registerLazySingleton<ProductRemoteDataSource>(
//         () => ProductRemoteDataSourceImpl(dio: sl()),
//   );
//   sl.registerLazySingleton<ProductRepository>(
//         () => ProductRepositoryImpl(remoteDataSource: sl()),
//   );
//   sl.registerLazySingleton<ProductUseCase>(() => ProductUseCase(sl()));
//   sl.registerLazySingleton<GetAllProductsUseCase>(
//         () => GetAllProductsUseCase(sl()),
//   );
//   sl.registerFactory<ProductBloc>(() => ProductBloc(productUseCase: sl(), getAllProductsUsecase: sl()));
//   sl.registerFactory<ProductsBloc>(
//         () => ProductsBloc(getAllProductsUseCase: sl()),
//   );
// }