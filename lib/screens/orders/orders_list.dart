import 'package:flutter/material.dart';
import 'package:stnatura/models/order.dart';
import 'package:stnatura/screens/orders/orders_list_item.dart';

class OrdersList extends StatelessWidget {
  final List<Order> orders;

  OrdersList({Key key, this.orders}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: orders.length,
      itemBuilder: (context, index) {
        return OrdersListItem(order: orders[index]);
      },
    );
  }
}
