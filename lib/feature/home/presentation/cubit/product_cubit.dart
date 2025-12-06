import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry_app/feature/home/doman/entities/home_entity.dart';
import 'package:hungry_app/feature/home/doman/usecases/home_usecases.dart';
import 'package:hungry_app/feature/home/presentation/cubit/product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final HomeUsecases homeUsecases;
  ProductCubit(this.homeUsecases) : super(ProductInitial());

  List<HomeEntity> _allProducts = [];

  void getProducts() async {
    if (isClosed) return;
    emit(ProductLoading());

    final result = await homeUsecases.getProducts();

    if (isClosed) return;

    result.fold(
      (failure) {
        if (!isClosed) {
          emit(ProductError(message: failure.message));
        }
      },
      (products) {
        if (!isClosed) {
          _allProducts = products;
          emit(ProductSuccess(products: products));
        }
      },
    );
  }

  void searchProducts(String query) {
    if (query.isEmpty) {
      emit(ProductSuccess(products: _allProducts));
      return;
    }
    final filteredProducts = _allProducts.where((product) {
      return product.title.toLowerCase().contains(query.toLowerCase());
    }).toList();
    emit(ProductSuccess(products: filteredProducts));
  }
}
