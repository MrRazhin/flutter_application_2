import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/Cart.dart';
import 'package:flutter_application_2/models/Product.dart';
import 'package:provider/provider.dart';

import 'CartPage.dart';

class ItemPage extends StatelessWidget {
  final String productId;
  const ItemPage({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    final data =
        Provider.of<ProductDataProvider>(context).getElementById(productId);
    return Scaffold(
      appBar: AppBar(
        title: Text(data.title),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            Hero(
              tag: data.imgUrl,
              child: Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(data.imgUrl), fit: BoxFit.cover),
                ),
              ),
            ),
            Card(
              elevation: 5.0,
              margin:
                  const EdgeInsets.symmetric(horizontal: 35.0, vertical: 10.0),
              child: Container(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  children: <Widget>[
                    Text(data.title, style: const TextStyle(fontSize: 26.0)),
                    const Divider(),
                    Row(
                      children: <Widget>[
                        const Text('Price ', style: TextStyle(fontSize: 24.0)),
                        Text('${data.price}',
                            style: const TextStyle(fontSize: 24.0)),
                      ],
                    ),
                    const Divider(),
                    Text(data.description),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Provider.of<CartDataProvider>(context)
                            .cartItems
                            .containsKey(productId)
                        ? Column(
                            children: <Widget>[
                              MaterialButton(
                                color: Colors.indigoAccent,
                                textColor: Colors.white,
                                child: const Text('Go tot cart'),
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => const CartPage()));
                                },
                              ),
                              const Text(
                                'Product added',
                                style: TextStyle(
                                    fontSize: 12.0, color: Colors.blueGrey),
                              )
                            ],
                          )
                        : MaterialButton(
                            color: Theme.of(context).primaryColor,
                            child: const Text('Add to cart'),
                            onPressed: () {
                              Provider.of<CartDataProvider>(context,
                                      listen: false)
                                  .addItem(
                                productId: data.id,
                                price: data.price,
                                title: data.title,
                                imgUrl: data.imgUrl,
                              );
                            },
                          )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
