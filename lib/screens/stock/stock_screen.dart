import 'package:flutter/material.dart';
import 'package:stnatura/models/product.dart';
import 'package:stnatura/screens/products/products_screen.dart';
import 'package:stnatura/screens/shared/products_list.dart';
import 'package:stnatura/services/products_services.dart';

class StockScreen extends StatefulWidget {
  StockScreen({Key key}) : super(key: key);

  @override
  _StockScreenState createState() => _StockScreenState();
}

class _StockScreenState extends State<StockScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        backgroundColor: Colors.orange[700],
      ),
      body: FutureBuilder<List<Product>>(
        future: fetchResellerStock(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? ProductList(
                  products: snapshot.data,
                )
              : Center(child: CircularProgressIndicator());
        },
      ),
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
