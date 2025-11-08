import 'package:flutter/material.dart';
import 'package:hungry_app/feature/cart/presentation/widget/cart_item_card.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      
      child: Column(
        children: [
          ListView.builder(
            itemCount: 5,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return const CartItemCard();
            },
          ),
          
        ],
      ),
    );
  }
}
