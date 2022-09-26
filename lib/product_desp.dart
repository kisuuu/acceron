import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

String? stringResponse;
Map? mapResponse;
List? listResponse;
String? id = "";

class ProductDescriptionScreen extends StatefulWidget {
  ProductDescriptionScreen({Key? key}) : super(key: key);

  @override
  State<ProductDescriptionScreen> createState() =>
      _ProductDescriptionScreenState();
}

class _ProductDescriptionScreenState extends State<ProductDescriptionScreen> {
  apicall() async {
    http.Response response;
    response =
        await http.get(Uri.parse("https://dummyjson.com/products" + id!));
    if (response.statusCode == 200) {
      setState(() {
        stringResponse = response.body;
        mapResponse = jsonDecode(stringResponse!);
        listResponse = mapResponse!['products'];
        // print(mapResponse);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        child: Card(
          child: Text('data'),
        ),
      ),
    );
  }
}
