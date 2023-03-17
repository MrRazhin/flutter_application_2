import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/Product.dart';
import 'package:provider/provider.dart';

import '../widgets/bottomBar.dart';
import '../widgets/catalog.dart';
import '../widgets/itemCart.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<ProductDataProvider>(context);

    return Scaffold(
      backgroundColor: Colors.indigoAccent,
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height - 85,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(35),
                bottomRight: Radius.circular(35),
              )),
          child: ListView(
            padding: const EdgeInsets.all(10.0),
            children: <Widget>[
              Container(
                child: const ListTile(
                  title: Text(
                    'Gregory Bot',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    'WGG',
                    style: TextStyle(fontSize: 16),
                  ),
                  trailing: Icon(Icons.dehaze_rounded),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(5.0),
                height: 290,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: productData.items.length,
                    itemBuilder: (context, int index) =>
                        ChangeNotifierProvider.value(
                          value: productData.items[index],
                          child: const ItemCart(),
                        )),
              ),
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text('Catalog'),
              ),
              ...productData.items.map((value) {
                return CatalogListTile(imgUrl: value.imgUrl);
              }).toList(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomBar(),
    );
  }
}
