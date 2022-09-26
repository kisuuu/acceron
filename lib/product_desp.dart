import 'dart:convert';

import 'package:acceron_practical/product_list.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductDescriptionScreen extends StatefulWidget {
  final desp;
  final id;
  ProductDescriptionScreen({
    Key? key,
    this.desp,
    this.id,
  }) : super(key: key);

  @override
  State<ProductDescriptionScreen> createState() =>
      _ProductDescriptionScreenState();
}

class _ProductDescriptionScreenState extends State<ProductDescriptionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Material(
        child: Column(
          children: [
            Text('${widget.desp}'),
            Text('${widget.id}'),
          ],
        ),
      ),
    );
  }
}
