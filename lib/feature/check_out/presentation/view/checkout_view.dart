import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry_app/core/di/di.dart';
import 'package:hungry_app/feature/cart/data/models/cart_response_model.dart';
import 'package:hungry_app/feature/check_out/presentation/widget/checkout_view_body.dart';
import 'package:hungry_app/feature/check_out/presentation/widget/payment_success_dialog.dart';
import 'package:hungry_app/feature/home/presentation/widget/price_section.dart';
import 'package:hungry_app/feature/order_history/presentation/cubit/order_cubit.dart';
import 'package:hungry_app/feature/order_history/presentation/cubit/order_state.dart';
import 'package:hungry_app/root.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({
    super.key,
    required this.totalPrice,
    required this.cartItems,
  });
  static const String routeName = 'checkout';
  final double totalPrice;
  final List<CartItemResponseModel> cartItems;

  @override
  Widget build(BuildContext context) {
    // Calculate final total with taxes and delivery
    const double taxRate = 0.14; // 14% tax
    const double deliveryFee = 10.0; // Fixed delivery fee
    final taxes = totalPrice * taxRate;
    final finalTotal = totalPrice + taxes + deliveryFee;

    return BlocProvider(
      create: (context) => getIt<OrderCubit>(),
      child: BlocListener<OrderCubit, OrderState>(
        listener: (context, state) {
          if (state is OrderSuccess) {
            showDialog(
              context: context,
              barrierDismissible: false,
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
          } else if (state is OrderError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        child: Scaffold(
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
            child: Builder(
              builder: (context) {
                return BlocBuilder<OrderCubit, OrderState>(
                  builder: (context, state) {
                    final isLoading = state is OrderLoading;
                    return PriceSection(
                      price: finalTotal.toStringAsFixed(2),
                      nameButton: 'Pay Now',
                      isLoading: isLoading,
                      onTap: () {
                        context.read<OrderCubit>().createOrder(cartItems);
                      },
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
