import 'package:flutter/material.dart';
import 'package:product_list/product_list.dart';

class CartPage extends StatelessWidget {
  final List<Product> products;

  const CartPage({super.key, required this.products});

  int getTotalProductCount() {
    int totalCount = 0;
    for (var product in products) {
      totalCount += product.counter;
    }
    return totalCount;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: Center(
        child: Text('Total products: ${getTotalProductCount()}'),
      ),
    );
  }
}
