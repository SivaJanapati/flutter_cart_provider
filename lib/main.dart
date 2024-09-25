import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_cart/pages/cart_page.dart';
import 'package:sample_cart/pages/products_page.dart';
import 'package:sample_cart/providers/cart_provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context)=>CartProvider()
    ,child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/products',
      routes: {
        '/products': (context)=>ProductsPage(),
        '/cart' : (context) => CartPage(),
      },
    );
  }
}
