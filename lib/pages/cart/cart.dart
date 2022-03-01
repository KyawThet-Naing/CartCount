import 'package:demo_state/components/count_button.dart';
import 'package:flutter/material.dart';
import '../../utils/global.dart';

class Cart extends StatefulWidget {
  static const String route = "/cart";
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ...List.generate(
              Global.cart.length,
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(Global.cart[index].product.name),
                        const SizedBox(height: 10),
                        Text('${Global.cart[index].product.price} /Ks'),
                      ],
                    ),
                    const Spacer(),

                    ///decrease count
                    CountButton(
                        onTap: () {
                          if (Global.cart[index].count == 1) {
                            Global.cart.remove(Global.cart[index]);
                            setState(() {});
                            return;
                          }
                          Global.cart[index].count--;
                          setState(() {});
                        },
                        icon: Icons.remove),

                    ///count text
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text('${Global.cart[index].count}'),
                    ),

                    ///increase count
                    CountButton(
                      onTap: () {
                        Global.cart[index].count++;
                        setState(() {});
                      },
                      icon: Icons.add,
                    ),
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
