import 'package:flutter/material.dart';
import 'package:stnatura/models/order.dart';
import 'package:stnatura/screens/order/order_screen.dart';

class OrdersListItem extends StatelessWidget {
  final Order order;

  OrdersListItem({Key key, this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: GestureDetector(
      onTap: () => {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => OrderScreen(
                      order: order,
                    )))
      },
      child: Card(
        child: Column(
          children: [
            ListTile(
              title: Text(order.cliente.name,
                  style: TextStyle(fontWeight: FontWeight.w500)),
              subtitle: Text(order.statusDescription),
              leading: Icon(
                Icons.shopping_basket,
                color: Colors.orange[800],
              ),
            ),
            Divider(),
            ListTile(
              title: Text("R\$ " + order.amount.toString(),
                  style: TextStyle(fontWeight: FontWeight.w500)),
              leading: Icon(
                Icons.monetization_on,
                color: Colors.orange[800],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
