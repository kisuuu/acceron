import 'dart:convert';
import 'package:acceron_practical/Model/model.dart';
import 'package:acceron_practical/product_desp.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

String? stringResponse;
Map? mapResponse;
List? listResponse;

class ProductScreen extends StatefulWidget {
  ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  apicall() async {
    http.Response response;
    response = await http.get(Uri.parse("https://dummyjson.com/products"));
    if (response.statusCode == 200) {
      setState(() {
        stringResponse = response.body;
        mapResponse = jsonDecode(stringResponse!);
        listResponse = mapResponse!['products'];
        print(listResponse);
      });
    }
  }

  @override
  void initState() {
    apicall();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: GridView.builder(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 300,
            childAspectRatio: 0.4,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          itemBuilder: (context, index) {
            final user = listResponse![index];
            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProductDescriptionScreen()));
              },
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text("Brand Name : " +
                          listResponse![index]['brand'].toString()),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Image.network(
                      listResponse![index]['thumbnail'],
                      fit: BoxFit.contain,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            listResponse![index]['title'].toString(),
                          ),
                          Text("Rating : " +
                              listResponse![index]['rating'].toString()),
                          Text('Discount :-' +
                              listResponse![index]['discountPercentage']
                                  .toString() +
                              "%"),
                          Text('Price \$' +
                              listResponse![index]['price'].toString()),
                          Text("Description :- " +
                              listResponse![index]['description'].toString()),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          itemCount: listResponse == null ? 0 : listResponse!.length,
        ));
  }
}
