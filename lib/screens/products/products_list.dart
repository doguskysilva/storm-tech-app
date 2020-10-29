import 'package:flutter/material.dart';
import 'package:mobileapp/models/product.dart';
import 'package:mobileapp/screens/products/products_list_item.dart';

class ProductList extends StatelessWidget {
  final List<Product> products;

  ProductList({Key key, this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        return ProductListItem(
          product: products[index],
        );
      },
    );
  }
}
