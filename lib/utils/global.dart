import 'package:demo_state/models/cart_model.dart';
import 'package:demo_state/models/products.dart';

class Global {
  static List<Product> prducts = [
    Product(name: "Product A", price: 1200),
    Product(name: "Product B", price: 1300),
    Product(name: "Product C", price: 1400),
    Product(name: "Product D", price: 1500),
    Product(name: "Product E", price: 1600),
  ];

  static List<CartModel> cart = [];
}
