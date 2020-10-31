import 'package:flutter/material.dart';
import 'package:mobileapp/models/product.dart';
import 'package:mobileapp/screens/%20product/product_screen.dart';

class ProductListItem extends StatefulWidget {
  final Product product;

  const ProductListItem({Key key, this.product}) : super(key: key);

  @override
  _ProductListItemState createState() => _ProductListItemState();
}

class _ProductListItemState extends State<ProductListItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          ListTile(
            leading: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  widget.product.picture,
                )),
            title: Text(widget.product.name),
            subtitle: Text('${widget.product.promptDelivery} items em estoque'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProductScreen(
                            product: widget.product,
                          )));
            },
          )
        ],
        mainAxisSize: MainAxisSize.min,
      ),
    );
  }
}
