import 'package:blockfirsttime/features/home/data/models/product_model.dart';
import '../../domain/entities/all_products.dart';


class AllProductsModel extends AllProducts {
  AllProductsModel({
    required super.products,
    required super.total,
    required super.skip,
    required super.limit,
  });

  factory AllProductsModel.fromJson(Map<String, dynamic> json) =>
      AllProductsModel(
        products:
        (json["products"] as List<dynamic>?)
            ?.map((x) => ProductModel.fromJson(x as Map<String, dynamic>))
            .toList() ??
            [],
        total: json["total"] ?? 0,
        skip: json["skip"] ?? 0,
        limit: json["limit"] ?? 0,
      );
}
