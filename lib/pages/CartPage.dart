import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/Cart.dart';
import '../widgets/CartListItem.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cartData = Provider.of<CartDataProvider>(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Cart'),
        ),
        body: cartData.cartItems.isEmpty
            ? Card(
                elevation: 5.0,
                margin: const EdgeInsets.all(30.0),
                child: Container(
                  height: 100,
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: const Text('Cart is empty'),
                ),
              )
            : Column(
                children: <Widget>[
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        'Total ${cartData.totalAmount.toStringAsFixed(2)}',
                        style: const TextStyle(fontSize: 20.0),
                      ),
                      MaterialButton(
                        onPressed: () {
                          cartData.clear();
                        },
                        color: Theme.of(context).primaryColor,
                        child: const Text('Buy'),
                      )
                    ],
                  ),
                  const Divider(),
                  Expanded(child: CartItemList(cartData: cartData))
                ],
              ));
  }
}
