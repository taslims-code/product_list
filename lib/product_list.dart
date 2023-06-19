import 'package:flutter/material.dart';

import 'cart_page.dart';

class ProductLists extends StatefulWidget {
  const ProductLists({Key? key}) : super(key: key);

  @override
  State<ProductLists> createState() => _ProductListsState();
}

class _ProductListsState extends State<ProductLists> {
  List<Product> products = [
    Product(name: 'Apple', price: 10.0),
    Product(name: 'Banana', price: 20.0),
    Product(name: 'Orange', price: 30.0),
    Product(name: 'Grapes', price: 40.0),
    Product(name: 'Car', price: 50.0),
    Product(name: 'Bike', price: 60.0),
    Product(name: 'Cycle', price: 70.0),
    Product(name: 'Laptop', price: 80.0),
    Product(name: 'Keyboard', price: 90.0),
    Product(name: 'Mouse', price: 100.0),
    Product(name: 'Headphone', price: 110.0),
    Product(name: 'Mobile', price: 120.0),
    Product(name: 'Remote', price: 130.0),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(products[index].name),
            subtitle: Text('\$${products[index].price.toStringAsFixed(2)}'),
            trailing: ProductCounter(
              product: products[index],
              onBuyNow: () {
                setState(() {
                  products[index].incrementCounter();
                  if (products[index].counter == 5) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Congratulations!'),
                          content:
                              Text('You\'ve bought 5 ${products[index].name}!'),
                          actions: <Widget>[
                            ElevatedButton(
                              child: const Text('OK'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  }
                });
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.shopping_cart),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CartPage(products: products)),
          );
        },
      ),
    );
  }
}

class Product {
  String name;
  double price;
  int counter;

  Product({required this.name, required this.price, this.counter = 0});

  void incrementCounter() {
    counter++;
  }
}

class ProductCounter extends StatelessWidget {
  final Product product;
  final VoidCallback onBuyNow;
  const ProductCounter(
      {Key? key, required this.product, required this.onBuyNow})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Counter: ${product.counter}'),
        const SizedBox(
          width: 10,
        ),
        ElevatedButton(
          onPressed: onBuyNow,
          child: const Text('Buy Now'),
        ),
      ],
    );
  }
}
