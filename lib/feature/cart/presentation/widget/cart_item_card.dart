
import 'package:flutter/material.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/core/widgets/custom_button.dart';
import 'package:hungry_app/feature/cart/presentation/widget/quantity_control_row.dart';

class CartItemCard extends StatelessWidget {
  const CartItemCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SizedBox(
        height: 185,
        child: Card(
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
    
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 90,
                      height: 90,
                      child: Image.asset('assets/images/image_test.png'),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Hamburger',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Text(
                      'Veggie Burger',
                      style: TextStyle(fontSize: 14, color: Colors.black54),
                    ),
                  ],
                ),
                Column(
                  children: [
                    QuantityControlRow(),
                    const Spacer(),
                    CustomButton(
                      text: 'Remove',
                      color: Colors.white,
                      backGroundColor: AppColors.primaryColor,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 6,
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
