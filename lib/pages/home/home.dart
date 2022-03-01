import 'package:demo_state/components/count_button.dart';
import 'package:demo_state/models/cart_model.dart';
import 'package:demo_state/models/products.dart';
import 'package:demo_state/pages/cart/cart.dart';
import 'package:flutter/material.dart';
import '../../utils/global.dart';

class Home extends StatefulWidget {
  static const String route = "/";

  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product'),
        actions: [
          IconButton(
            onPressed: () async {
              await Navigator.pushNamed(context, Cart.route);

              ///setState for product count
              setState(() {});
            },
            icon: const Icon(Icons.shopping_cart),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, right: 10),
            child: Text('${Global.cart.length}'),
          )
        ],
      ),
      body: Column(
        children: [
          ...List.generate(Global.prducts.length, (index) {
            ///current product
            Product product = Global.prducts[index];

            ///cart index can be -1
            ///if -1, not found in cart
            int cartIndex = indexOf(product.name);

            return Container(
                margin: const EdgeInsets.all(5),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.blue.shade200,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(product.name),
                        const SizedBox(height: 10),
                        Text('${product.price} /Ks'),
                      ],
                    ),
                    const Spacer(),

                    ///product not found in cart
                    cartIndex == -1
                        ?

                        ///add to cart button
                        MaterialButton(
                            height: 40,
                            minWidth: 80,
                            color: Colors.red,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            onPressed: () {
                              Global.cart.add(
                                CartModel(count: 1, product: product),
                              );
                              setState(() {});
                            },
                            child: const Text(
                              'Add to cart',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          )
                        :

                        ///product count button row
                        Row(
                            children: [
                              ///decrease count
                              CountButton(
                                onTap: () {
                                  if (Global.cart[cartIndex].count <= 1) {
                                    Global.cart.removeAt(cartIndex);
                                    setState(() {});
                                    return;
                                  }

                                  ///else
                                  Global.cart[cartIndex].count--;
                                  setState(() {});
                                },
                                icon: Icons.remove,
                              ),

                              ///count text
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                ),
                                child: Text('${Global.cart[cartIndex].count}'),
                              ),

                              ///increase count
                              CountButton(
                                onTap: () {
                                  Global.cart[cartIndex].count++;
                                  setState(() {});
                                },
                                icon: Icons.add,
                              ),
                            ],
                          )
                  ],
                ));
          })
        ],
      ),
    );
  }

  int indexOf(String productName) {
    ///find index of Global.cart by product name
    ///found = found index
    ///not found = -1
    return Global.cart.indexWhere((e) => e.product.name == productName);

    ///if return value is -1, product not found
  }
}
