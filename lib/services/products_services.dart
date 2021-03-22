import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:stnatura/models/product.dart';
import 'package:stnatura/services/core.dart';

List<Product> parserProducts(String responseBody) {
  final parsed = json.decode(responseBody)['data'].cast<Map<String, dynamic>>();
  return parsed.map<Product>((json) => Product.fromJson(json)).toList();
}

Future<List<Product>> fetchResellerProducts() async {
  final response = await http.get(mountApiURl('products'));

  return parserProducts(response.body)
      .where((element) => element.promptDelivery == null)
      .toList();
}

Future<List<Product>> fetchResellerStock() async {
  final response = await http.get(mountApiURl('reseller-store'));

  return parserProducts(response.body);
}

Future<bool> addProductToStock(Product product) async {
  Map bodyRequest = {"product_id": product.id, "amount": 1};

  final response = await http.post(mountApiURl('reseller-store'),
      headers: {"Content-Type": "application/json"},
      body: json.encode(bodyRequest));

  return response.statusCode == 200 ? true : false;
}

Future<bool> addItemProduct(Product product) async {
  final response =
      await http.post(mountApiURl('reseller-store/add/${product.id}'));

  return response.statusCode == 200 ? true : false;
}

Future<bool> removeItemProduct(Product product) async {
  final response =
      await http.post(mountApiURl('reseller-store/remove/${product.id}'));

  return response.statusCode == 200 ? true : false;
}
