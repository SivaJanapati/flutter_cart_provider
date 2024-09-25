import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_cart/consts.dart';
import 'package:sample_cart/providers/cart_provider.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      title: const Text(
        "Products",
      ),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, "/cart");
          },
          icon: const Icon(
            Icons.shopping_cart,
          ),
        ),
      ],
    );
  }

  Widget _buildUI(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    return ListView.builder(
        itemCount: Products.length,
        itemBuilder: (context, index) {
          Product product = Products[index];
          String price = product.price.toString();
          return ListTile(
            leading: Container(
              height: 30,
              width: 40,
              color: product.color,
            ),
            title: Text(product.name),
            subtitle: Text("\$$price"),
            trailing: Checkbox(
                value: cartProvider.items.contains(product),
                onChanged: (value) {
                  if (value == true) {
                    cartProvider.add(product);
                  } else {
                    cartProvider.remove(product);
                  }
                }),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: _buildUI(context),
    );
  }
}
