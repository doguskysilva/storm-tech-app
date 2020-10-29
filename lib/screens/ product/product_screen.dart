import 'package:flutter/material.dart';
import 'package:mobileapp/models/product.dart';

class ProductScreen extends StatelessWidget {
  final Product product;

  const ProductScreen({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: Center(
        child: Text(product.description),
      ),
      bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          child: Container(
            height: 50.0,
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (product.promptDelivery != null) {
            print('Vamos compartilhar');
          } else {
            print('Vamos adicionar');
          }
        },
        tooltip: 'Adicionar Produto',
        child: Icon(product.promptDelivery != null ? Icons.share : Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
