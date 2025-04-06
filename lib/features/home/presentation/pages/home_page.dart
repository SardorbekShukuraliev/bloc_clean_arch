import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: ListView(
        children: [
          _buildNavigationButton(context, 'Get All Products', '/get_all_products'),
          _buildNavigationButton(context, 'Get a Single Product', '/get_single_product'),
          _buildNavigationButton(context, 'Search Products', '/search_products'),
          _buildNavigationButton(context, 'Sort Products', '/sort_products'),
          _buildNavigationButton(context, 'Get All Categories', '/get_all_categories'),
          _buildNavigationButton(context, 'Get Category List', '/get_category_list'),
          _buildNavigationButton(context, 'Get Products by Category', '/get_products_by_category'),
          _buildNavigationButton(context, 'Add New Product', '/add_new_product'),
          _buildNavigationButton(context, 'Update Product', '/update_product'),
          _buildNavigationButton(context, 'Delete Product', '/delete_product'),
        ],
      ),
    );
  }

  Widget _buildNavigationButton(BuildContext context, String title, String route) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, route);
        },
        child: Text(title),
      ),
    );
  }
}
