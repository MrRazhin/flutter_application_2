import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/Product.dart';
import 'package:flutter_application_2/pages/HomePage.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';

import 'models/Cart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProductDataProvider>(
          create: (context) => ProductDataProvider(),
        ),
        ChangeNotifierProvider<CartDataProvider>(
          create: (context) => CartDataProvider(),
        ),
      ],
      child: MaterialApp(
        title: "Demo App",
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        home: const HomePage(),
      ),
    );
  }
}
