import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry_app/feature/cart/data/models/cart_item_model.dart';
import 'package:hungry_app/feature/cart/data/models/cart_response_model.dart';
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

    CartResponseModel? currentData;
    if (state is CartFetchSuccess) {
      currentData = (state as CartFetchSuccess).cartModel;
    } else if (state is CartFetchLoading) {
      currentData = (state as CartFetchLoading).cartModel;
    } else if (state is CartRemoveLoading) {
      currentData = (state as CartRemoveLoading).cartModel;
    }

    emit(CartFetchLoading(cartModel: currentData));

    final result = await getCartUseCase();

    if (isClosed) return;

    result.fold(
      (failure) {
        if (!isClosed) {
          emit(
            CartFetchError(message: failure.message, cartModel: currentData),
          );
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

    CartResponseModel? currentData;
    if (state is CartFetchSuccess) {
      currentData = (state as CartFetchSuccess).cartModel;
    } else if (state is CartFetchLoading) {
      currentData = (state as CartFetchLoading).cartModel;
    } else if (state is CartFetchError) {
      currentData = (state as CartFetchError).cartModel;
    }

    emit(CartRemoveLoading(cartModel: currentData));

    final result = await removeFromCartUseCase(itemId);

    if (isClosed) return;

    result.fold(
      (failure) {
        if (!isClosed) {
          emit(
            CartRemoveError(message: failure.message, cartModel: currentData),
          );
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
