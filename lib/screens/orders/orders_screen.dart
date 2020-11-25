import 'package:flutter/material.dart';
import 'package:mobileapp/models/order.dart';
import 'package:mobileapp/models/product.dart';
import 'package:mobileapp/screens/orders/orders_list.dart';
import 'package:mobileapp/screens/products/products_screen.dart';
import 'package:mobileapp/screens/shared/products_list.dart';
import 'package:mobileapp/services/orders_services.dart';
import 'package:mobileapp/services/products_services.dart';

class OrdersScreen extends StatefulWidget {
  OrdersScreen({Key key}) : super(key: key);

  @override
  _OrdersScreenState createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(''),
        ),
        body: FutureBuilder<List<Order>>(
          future: fetchOrders(),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);
            return snapshot.hasData
                ? OrdersList(orders: snapshot.data)
                : Center(child: CircularProgressIndicator());
          },
        ));
  }
}
