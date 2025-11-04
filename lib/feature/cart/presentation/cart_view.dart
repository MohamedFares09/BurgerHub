import 'package:flutter/material.dart';
import 'package:hungry_app/feature/cart/presentation/widget/cart_view_body.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});
  static const routeName = 'cart view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: CartViewBody());
  }
}
