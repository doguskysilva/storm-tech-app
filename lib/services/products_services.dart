import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobileapp/models/product.dart';
import 'package:mobileapp/services/core.dart';

List<Product> parserProducts(String responseBody) {
  final parsed = json.decode(responseBody)['data'].cast<Map<String, dynamic>>();
  return parsed.map<Product>((json) => Product.fromJson(json)).toList();
}

Future<List<Product>> fetchResellerProducts() async {
  final response = await http.get(mountApiURl('reseller-store'));

  return parserProducts(response.body);
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
