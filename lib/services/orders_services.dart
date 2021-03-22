import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:stnatura/models/order.dart';
import 'package:stnatura/services/core.dart';

List<Order> parserOrders(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Order>((json) => Order.fromJson(json)).toList();
}

Future<List<Order>> fetchOrders() async {
  final response = await http.get(mountApiURl('orders'));

  return parserOrders(response.body)
      .where((element) => element.cliente != null)
      .toList();
}

Future<Order> fetchOrder(Order order) async {
  final response = await http.get(mountApiURl('orders/${order.id}'));

  return null; //parserOrders(response.body);
}

Future<bool> updateStatusOrder(Order order) async {
  Map bodyRequest = {"order_id": order.id, "amount": 1};

  final response = await http.post(mountApiURl('reseller-store'),
      headers: {"Content-Type": "application/json"},
      body: json.encode(bodyRequest));

  return response.statusCode == 200 ? true : false;
}
