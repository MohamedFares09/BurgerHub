import 'package:flutter/material.dart';
import 'package:hungry_app/feature/check_out/presentation/widget/checkout_view_body.dart';
import 'package:hungry_app/feature/check_out/presentation/widget/payment_success_dialog.dart';
import 'package:hungry_app/feature/home/presentation/widget/price_section.dart';
import 'package:hungry_app/root.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key, required this.totalPrice});
  static const String routeName = 'checkout';
  final double totalPrice;

  @override
  Widget build(BuildContext context) {
    // Calculate final total with taxes and delivery
    const double taxRate = 0.14; // 14% tax
    const double deliveryFee = 10.0; // Fixed delivery fee
    final taxes = totalPrice * taxRate;
    final finalTotal = totalPrice + taxes + deliveryFee;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: SafeArea(child: CheckoutViewBody(orderTotal: totalPrice)),
      bottomSheet: SizedBox(
        height: 120,
        child: PriceSection(
          price: finalTotal.toStringAsFixed(2),
          nameButton: 'Pay Now',
          onTap: () {
            return showDialog(
              context: context,
              builder: (context) {
                return PaymentSuccessDialog(
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      Root.routeName,
                      (route) => false,
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
