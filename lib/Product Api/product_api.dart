import 'dart:convert';

import 'package:http/http.dart' as http;

import '../Model/model.dart';

class ProductsApi {
  static Future<List<Product>> getProducts() async {
    final url = "https://dummyjson.com/products";
    final response = await http.get(Uri.parse(url));
    final body = jsonDecode(response.body)['products'];
    //  String  stringResponse = response.body;
    //    Map mapResponse = jsonDecode(stringResponse!);
    //    List listResponse = mapResponse['products'];

    return body.map<Product>(Product.fromJson(json));
  }
}
