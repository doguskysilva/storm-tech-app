import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobileapp/models/product.dart';
import 'package:mobileapp/services/core.dart';

List<Product> parserProducts(String responseBody) {
  final parsed = json.decode(responseBody)['data'].cast<Map<String, dynamic>>();
  return parsed.map<Product>((json) => Product.fromJson(json)).toList();
}

Future<List<Product>> fetchResellerProducts() async {
  final response = await http.get(baseUrl('reseller-store'));

  return parserProducts(response.body);
}
