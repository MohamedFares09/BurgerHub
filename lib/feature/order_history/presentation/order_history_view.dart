import 'package:flutter/material.dart';
import 'package:hungry_app/feature/order_history/presentation/widget/order_history_body.dart';

class OrderHistoryView extends StatelessWidget {
  const OrderHistoryView({super.key});
  static const routeName = 'order history view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: OrderHistoryBody());
  }
}
