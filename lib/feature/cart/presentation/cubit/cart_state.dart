import 'package:hungry_app/feature/cart/data/models/cart_response_model.dart';

abstract class CartState {}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartAddSuccess extends CartState {
  final String message;
  CartAddSuccess({this.message = 'Added to cart successfully!'});
}

class CartError extends CartState {
  final String message;
  CartError({required this.message});
}

class CartFetchLoading extends CartState {
  final CartResponseModel? cartModel;
  CartFetchLoading({this.cartModel});
}

class CartFetchSuccess extends CartState {
  final CartResponseModel cartModel;
  CartFetchSuccess({required this.cartModel});
}

class CartFetchError extends CartState {
  final String message;
  final CartResponseModel? cartModel;
  CartFetchError({required this.message, this.cartModel});
}

class CartRemoveLoading extends CartState {
  final CartResponseModel? cartModel;
  CartRemoveLoading({this.cartModel});
}

class CartRemoveSuccess extends CartState {
  final String message;
  CartRemoveSuccess({this.message = 'Item removed successfully!'});
}

class CartRemoveError extends CartState {
  final String message;
  final CartResponseModel? cartModel;
  CartRemoveError({required this.message, this.cartModel});
}
