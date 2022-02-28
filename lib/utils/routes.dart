import 'package:flutter/material.dart';
import '../pages/cart.dart';
import '/pages/home.dart';

class Routes {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Home.route:
        return pageRoute(page: const Home(), routeName: Home.route);

      case Cart.route:
        return pageRoute(page: const Cart(), routeName: Cart.route);

      default:

        ///404 page for web
        break;
    }
    return null;
  }

  static MaterialPageRoute pageRoute(
      {required Widget page, required String routeName}) {
    return MaterialPageRoute(
      builder: (context) => page,
      settings: RouteSettings(name: routeName),
    );
  }
}
