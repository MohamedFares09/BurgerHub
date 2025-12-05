import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/feature/cart/data/models/cart_response_model.dart';
import 'package:hungry_app/feature/cart/presentation/cubit/cart_cubit.dart';
import 'package:hungry_app/feature/cart/presentation/cubit/cart_state.dart';
import 'package:hungry_app/feature/cart/presentation/widget/cart_item_widget.dart';
import 'package:hungry_app/feature/check_out/presentation/view/checkout_view.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartState>(
      buildWhen: (previous, current) =>
          current is! CartRemoveSuccess && current is! CartAddSuccess,
      listener: (context, state) {
        if (state is CartRemoveSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.green,
              duration: const Duration(seconds: 2),
            ),
          );
        } else if (state is CartRemoveError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.red,
              duration: const Duration(seconds: 2),
            ),
          );
        }
      },
      builder: (context, state) {
        // Extract data and loading status
        CartResponseModel? cartModel;
        bool isLoading = false;

        if (state is CartFetchSuccess) {
          cartModel = state.cartModel;
        } else if (state is CartFetchLoading) {
          cartModel = state.cartModel;
          if (cartModel != null) isLoading = true; // Refreshing
        } else if (state is CartRemoveLoading) {
          cartModel = state.cartModel;
          isLoading = true; // Deleting
        } else if (state is CartFetchError) {
          cartModel = state.cartModel;
        } else if (state is CartRemoveError) {
          cartModel = state.cartModel;
        }

        // If we have data, show the list (with overlay if loading)
        if (cartModel != null) {
          if (cartModel.items.isEmpty) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.shopping_cart_outlined, size: 75),
                  SizedBox(height: 16),
                  Text('Your cart is empty', style: TextStyle(fontSize: 20)),
                ],
              ),
            );
          }
          return Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: cartModel.items.length,
                      itemBuilder: (context, index) {
                        return CartItemWidget(item: cartModel!.items[index]);
                      },
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(30),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          offset: const Offset(0, -5),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Total:',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '${cartModel.totalPrice.toStringAsFixed(2)} EGP',
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: AppColors.primaryColor,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                CheckoutView.routeName,
                                arguments: {
                                  'totalPrice': cartModel!.totalPrice,
                                  'cartItems': cartModel!.items,
                                },
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            child: const Text(
                              'Checkout',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              if (isLoading)
                Container(
                  color: Colors.black.withOpacity(0.5),
                  child: const Center(child: CircularProgressIndicator()),
                ),
            ],
          );
        }

        // Fallback for initial loading or error without data
        if (state is CartFetchLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is CartFetchError) {
          return Center(child: Text(state.message));
        }

        return const SizedBox();
      },
    );
  }
}
