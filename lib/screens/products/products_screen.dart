import 'package:flutter/material.dart';
import 'package:stnatura/models/product.dart';
import 'package:stnatura/screens/shared/products_list.dart';
import 'package:stnatura/services/products_services.dart';

class ProductsScreen extends StatefulWidget {
  ProductsScreen({Key key}) : super(key: key);

  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catálogo'),
      ),
      body: FutureBuilder<List<Product>>(
        future: fetchResellerProducts(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? ProductList(
                  products: snapshot.data,
                )
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
