import 'package:flutter/material.dart';
import 'package:stnatura/models/product.dart';
import 'package:stnatura/screens/shared/products_list_item.dart';

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
