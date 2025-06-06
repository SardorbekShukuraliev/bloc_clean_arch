import 'package:dio/dio.dart';
import '../models/categories_model.dart';


abstract class CategoryRemoteDataSource {
  Future<List<CategoryModel>> getCategories();
}

class CategoryRemoteDataSourceImpl implements CategoryRemoteDataSource {
  final Dio dio;

  CategoryRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<CategoryModel>> getCategories() async {
    final response = await dio.get('https://dummyjson.com/products/categories');

    if (response.statusCode == 200) {
      List jsonData = response.data;
      return jsonData
          .map((category) => CategoryModel.fromJson(category))
          .toList();
    } else {
      throw Exception('Failed to get products');
    }
  }
}
