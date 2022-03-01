import 'package:demo_state/models/products.dart';

class CartModel {
  int count;
  
  Product product;
  CartModel({required this.count, required this.product});
}
