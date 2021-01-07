import 'dart:collection';
import 'package:flutter/material.dart';
import '../models/product.dart';

class StockModel extends ChangeNotifier {
  final List<Product> _products = [];

  UnmodifiableListView<Product> get products => UnmodifiableListView(_products);

  int get totalStock => _products.length;

  void add(Product product) {
    _products.add(product);
    notifyListeners();
  }

  void loadMany(List<Product> manyProducts) {
    _products.addAll(manyProducts);
    notifyListeners();
  }

  void removeAll() {
    _products.clear();
    notifyListeners();
  }
}
