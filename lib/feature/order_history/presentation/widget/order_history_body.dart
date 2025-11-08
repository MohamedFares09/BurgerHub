import 'package:flutter/material.dart';

import 'package:hungry_app/feature/order_history/presentation/widget/card_order_history.dart';

class OrderHistoryBody extends StatelessWidget {
  const OrderHistoryBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return CardOrederHistory();
        },
      ),
    );
  }
}
