import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/src/models/producto.dart';
import 'package:http/http.dart' as http;

class ProductService extends ChangeNotifier {
  final String _baseUrl =
      'flutter-base-prueba-ac1ae-default-rtdb.firebaseio.com';
  final List<Product> products = [];
  bool isLoading = true;
  bool isSaving = false;

  //Cargar Producto----------------------------------------
  Future<List<Product>> loadProducts() async {
    isLoading = true;
    notifyListeners();

    final url = Uri.https(_baseUrl, 'products.json');
    final resp = await http.get(url);

    final Map<String, dynamic> productsMap = json.decode(resp.body);

    productsMap.forEach((key, value) {
      final tempProduct = Product.fromRawJson(json.encode(value));
      products.add(tempProduct);
    });

    isLoading = false;
    notifyListeners();
    return products;
  }
}
