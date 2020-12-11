import 'package:flutter/material.dart';
import 'package:mobileapp/models/product.dart';
import 'package:mobileapp/screens/shared/products_list.dart';
import 'package:mobileapp/services/products_services.dart';

import '../../models/product.dart';
import '../../services/products_services.dart';

class ProductsScreen extends StatefulWidget {
  ProductsScreen({Key key}) : super(key: key);

  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  List<Product> _products = [];

  void _loadResellerProducts() async {
    var result = await fetchResellerProducts();
    setState(() {
      _products = result;
    });
  }

  Future<void> _getData() async {
    setState(() {
      _loadResellerProducts();
    });
  }

  @override
  void initState() {
    super.initState();
    _loadResellerProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Catálogo'),
        ),
        body: _products.length == 0
            ? Center(child: CircularProgressIndicator())
            : RefreshIndicator(
                child: ProductList(
                  products: _products,
                ),
                onRefresh: _getData));
  }
}
