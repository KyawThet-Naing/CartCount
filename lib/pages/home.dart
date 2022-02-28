import 'package:demo_state/models/cart_model.dart';
import 'package:demo_state/models/products.dart';
import 'package:demo_state/pages/cart.dart';
import 'package:flutter/material.dart';
import '../utils/global.dart';

class Home extends StatelessWidget {
  static const String route = "/";

  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, Cart.route);
            },
            icon: const Icon(Icons.shopping_cart),
          )
        ],
      ),
      body: Column(
        children: [
          ...List.generate(
            Global.prducts.length,
            (index) => Container(
              margin: const EdgeInsets.all(5),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.blue.shade200,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Column(
                    children: [
                      Text(Global.prducts[index].name),
                      Text(
                        Global.prducts[index].price.toString(),
                      ),
                    ],
                  ),
                  const Spacer(),
                  MaterialButton(
                      color: Colors.red,
                      onPressed: () {
                        Product product = Global.prducts[index];

                        ///index of current product
                        int i = Global.cart.indexWhere(
                          (element) => element.product.name == product.name,
                        );

                        ///found = found index
                        ///not found = -1

                        if (i == -1) {
                          Global.cart.add(
                            CartModel(count: 1, product: product),
                          );
                        } else {
                          int pCount = Global.cart[i].count + 1;
                          Global.cart.removeAt(i);
                          Global.cart.insert(
                            i,
                            CartModel(count: pCount, product: product),
                          );
                        }
                      },
                      child: const Text(
                        'Buy',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
