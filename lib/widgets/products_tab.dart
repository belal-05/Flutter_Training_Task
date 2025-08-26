import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/product_provider.dart';
import 'product_grid.dart';

class ProductsTab extends StatelessWidget {
  const ProductsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(
      builder: (context, productProvider, child) {
        if (productProvider.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (productProvider.error != null) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Error: ${productProvider.error}'),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => productProvider.fetchProducts(),
                  child: const Text('Retry'),
                ),
              ],
            ),
          );
        }
        return ProductGrid(products: productProvider.products);
      },
    );
  }
}
