import 'package:flutter/material.dart';
import 'package:stnatura/models/order.dart';
import 'package:stnatura/screens/orders/orders_list.dart';
import 'package:stnatura/services/orders_services.dart';

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
