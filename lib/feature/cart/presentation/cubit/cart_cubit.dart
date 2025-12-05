import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry_app/feature/cart/data/models/cart_item_model.dart';
import 'package:hungry_app/feature/cart/domain/usecases/add_to_cart_usecase.dart';
import 'package:hungry_app/feature/cart/domain/usecases/get_cart_usecase.dart';
import 'package:hungry_app/feature/cart/domain/usecases/remove_from_cart_usecase.dart';
import 'package:hungry_app/feature/cart/presentation/cubit/cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final AddToCartUseCase addToCartUseCase;
  final GetCartUseCase getCartUseCase;
  final RemoveFromCartUseCase removeFromCartUseCase;

  CartCubit({
    required this.addToCartUseCase,
    required this.getCartUseCase,
    required this.removeFromCartUseCase,
  }) : super(CartInitial());

  Future<void> addToCart(CartItemModel cartItem) async {
    if (isClosed) return;
    emit(CartLoading());

    final request = AddToCartRequest(items: [cartItem]);
    final result = await addToCartUseCase(request);

    if (isClosed) return;

    result.fold(
      (failure) {
        if (!isClosed) {
          emit(CartError(message: failure.message));
        }
      },
      (_) {
        if (!isClosed) {
          emit(CartAddSuccess());
        }
      },
    );
  }

  Future<void> getCart() async {
    if (isClosed) return;
    emit(CartFetchLoading());

    final result = await getCartUseCase();

    if (isClosed) return;

    result.fold(
      (failure) {
        if (!isClosed) {
          emit(CartFetchError(message: failure.message));
        }
      },
      (cartModel) {
        if (!isClosed) {
          emit(CartFetchSuccess(cartModel: cartModel));
        }
      },
    );
  }

  Future<void> removeFromCart(int itemId) async {
    if (isClosed) return;
    emit(CartRemoveLoading());

    final result = await removeFromCartUseCase(itemId);

    if (isClosed) return;

    result.fold(
      (failure) {
        if (!isClosed) {
          emit(CartRemoveError(message: failure.message));
        }
      },
      (_) {
        if (!isClosed) {
          emit(CartRemoveSuccess());
          // Refresh cart after successful removal
          getCart();
        }
      },
    );
  }
}
