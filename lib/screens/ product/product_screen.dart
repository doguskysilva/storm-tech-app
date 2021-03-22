import 'dart:io';
import 'dart:typed_data';

import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:stnatura/models/product.dart';
import 'package:stnatura/services/bitly_service.dart';
import 'package:stnatura/services/core.dart';
import 'package:stnatura/services/products_services.dart';

class ProductScreen extends StatefulWidget {
  final Product product;

  const ProductScreen({Key key, this.product}) : super(key: key);

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  void _addItemProduct() {
    addItemProduct(widget.product).then((value) {
      setState(() {
        widget.product.promptDelivery += 1;
      });

      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text("Item adicionado"),
        duration: Duration(seconds: 2),
      ));
    });
  }

  void _removeItemProduct() {
    if (widget.product.promptDelivery != null &&
        widget.product.promptDelivery > 0) {
      removeItemProduct(widget.product).then((value) {
        setState(() {
          widget.product.promptDelivery -= 1;
        });

        _scaffoldKey.currentState.showSnackBar(SnackBar(
          content: Text("Item removido"),
          duration: Duration(seconds: 2),
        ));
      });
    }
  }

  void _shareProduct() async {
    BitLyRequests()
        .fetchShortLink(
            mountShareUrl("products/${widget.product.id}").toString())
        .then((value) async {
      String shareText =
          "Temos o ${widget.product.name} disponível por apenas R\$ ${widget.product.price}. \n $value";
      var request =
          await HttpClient().getUrl(Uri.parse(widget.product.picture));
      var response = await request.close();
      Uint8List bytes = await consolidateHttpClientResponseBytes(response);
      await Share.file(widget.product.name,
          "product_${widget.product.id.toString()}.jpg", bytes, 'image/jpg',
          text: shareText);
    }).catchError((error) {
      print(error);
    });
  }

  void _addProductToStock() {
    addProductToStock(widget.product)
        .then((value) => {
              setState(() {
                widget.product.promptDelivery = 1;
              })
            })
        .catchError((onError) => {print(onError.toString())});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text(widget.product.name),
          backgroundColor: Colors.orange,
        ),
        body: Container(
          child: SingleChildScrollView(
            // padding: EdgeInsets.all(10),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(widget.product.picture),
                Padding(
                    padding: EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'R\$ ${widget.product.price.toString()}',
                          style: TextStyle(
                              fontSize: 28, fontWeight: FontWeight.bold),
                        ),
                        widget.product.promptDelivery != null
                            ? RichText(
                                text: TextSpan(
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                  children: [
                                    WidgetSpan(
                                      child: Icon(
                                        Icons.shopping_basket,
                                        color: Colors.black26,
                                      ),
                                    ),
                                    TextSpan(
                                      text: ' ${widget.product.promptDelivery}',
                                    ),
                                  ],
                                ),
                              )
                            : Text('')
                      ],
                    )),
                Padding(
                    padding: EdgeInsets.only(left: 16, right: 16, bottom: 20),
                    child: Text(
                      widget.product.description,
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 16),
                    ))
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              if (widget.product.promptDelivery != null)
                IconButton(
                  onPressed: _addItemProduct,
                  icon: Icon(Icons.add_circle_outline),
                  color: Colors.brown[900],
                ),
              if (widget.product.promptDelivery != null)
                IconButton(
                  onPressed: _removeItemProduct,
                  icon: Icon(Icons.remove_circle_outline),
                  color: Colors.brown[900],
                )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.orange[700],
          foregroundColor: Colors.white,
          onPressed: () {
            if (widget.product.promptDelivery != null) {
              _shareProduct();
            } else {
              _addProductToStock();
            }
          },
          tooltip: widget.product.promptDelivery != null
              ? 'Compartilhar Produto'
              : 'Adicionar Produto',
          child: Icon(
              widget.product.promptDelivery != null ? Icons.share : Icons.add),
        ),
        floatingActionButtonLocation: widget.product.promptDelivery == null
            ? FloatingActionButtonLocation.endFloat
            : FloatingActionButtonLocation.centerDocked);
  }
}
