import 'package:flutter/material.dart';
import 'package:mobileapp/models/product.dart';
import 'package:mobileapp/screens/products/products_screen.dart';
import 'package:mobileapp/screens/shared/products_list.dart';
import 'package:mobileapp/services/products_services.dart';

import '../../services/products_services.dart';

class StockScreen extends StatefulWidget {
  StockScreen({Key key}) : super(key: key);

  @override
  _StockScreenState createState() => _StockScreenState();
}

class _StockScreenState extends State<StockScreen> {
  List<Product> _products = [];

  void _loadStock() async {
    var result = await fetchResellerStock();
    setState(() {
      _products = result;
    });
  }

  Future<void> _getData() async {
    setState(() {
      _loadStock();
    });
  }

  @override
  void initState() {
    super.initState();
    _loadStock();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        backgroundColor: Colors.orange[700],
      ),
      body: _products.length == 0
          ? Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              child: ProductList(
                products: _products,
              ),
              onRefresh: _getData),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.orange[700],
          foregroundColor: Colors.white,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ProductsScreen()));
          },
          child: Icon(Icons.add)),
    );
  }
}
