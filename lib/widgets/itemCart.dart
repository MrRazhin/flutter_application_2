import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/Cart.dart';
import 'package:flutter_application_2/pages/ItemPage.dart';
import 'package:provider/provider.dart';

import '../models/Product.dart';

class ItemCart extends StatelessWidget {
  const ItemCart({super.key});

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);

    return Container(
      width: 150,
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Color(int.parse(product.color)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ItemPage(productId: product.id,)));
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  height: 160,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.5),
                      image: DecorationImage(
                          image: NetworkImage(product.imgUrl),
                          fit: BoxFit.cover)),
                ),
                Container(
                  child: Text(
                    product.title,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
          Container(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('${product.price}'),
                  IconButton(
                      onPressed: () {
                        Provider.of<CartDataProvider>(context, listen: false)
                            .addItem(
                          productId: product.id,
                          price: product.price,
                          title: product.title,
                          imgUrl: product.imgUrl,
                        );
                      },
                      icon: const Icon(
                        Icons.add_circle_outline,
                        color: Colors.black12,
                      ))
                ]),
          )
        ],
      ),
    );
  }
}
