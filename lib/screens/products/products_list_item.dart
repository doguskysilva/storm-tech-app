import 'package:flutter/material.dart';
import 'package:mobileapp/models/product.dart';
import 'package:mobileapp/screens/%20product/product_screen.dart';

class ProductListItem extends StatelessWidget {
  final Product product;

  const ProductListItem({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          ListTile(
            leading: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  product.picture,
                )),
            title: Text(product.name),
            subtitle: Text('${product.promptDelivery} items em estoque'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProductScreen(
                            product: product,
                          )));
            },
          )
        ],
        mainAxisSize: MainAxisSize.min,
      ),
    );
  }
}
