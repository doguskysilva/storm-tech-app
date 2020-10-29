import 'package:flutter/material.dart';

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
        title: const Text(''),
      ),
      body: Center(child: Text('Products')),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            //Navigator.push(
            //context, MaterialPageRoute(builder: (context) => Details()));
          },
          child: Icon(Icons.add)),
    );
  }
}
