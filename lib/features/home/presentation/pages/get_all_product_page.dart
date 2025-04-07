import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/service_locator.dart';
import '../bloc/single_product/product_bloc.dart';
import '../bloc/single_product/product_event.dart';
import '../bloc/single_product/product_state.dart';


class GetAllProducts extends StatelessWidget {
  const GetAllProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('All Products')),
      body: BlocProvider(
        create: (context) => ProductBloc(productUseCase: sl(), getProductsUseCase: sl())..add(GetAllProductsEvent()),
        child: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            if (state is ProductLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is AllProductsLoaded) {
              return ListView.builder(
                itemCount: state.products.length,
                itemBuilder: (context, index) {
                  final product = state.products[index];
                  return ListTile(
                    leading: Image.network(product.thumbnail),
                    title: Text(product.title),
                    subtitle: Text('${product.price} \$'),
                  );
                },
              );
            } else if (state is ProductError) {
              return Center(child: Text('Error: ${state.message}'));
            }
            return const Center(child: Text('No info'));
          },
        ),
      ),
    );
  }
}
