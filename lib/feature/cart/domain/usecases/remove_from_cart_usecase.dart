import 'package:dartz/dartz.dart';
import 'package:hungry_app/core/networking/errors/faliuer.dart';
import 'package:hungry_app/feature/cart/domain/repos/cart_repo.dart';

class RemoveFromCartUseCase {
  final CartRepo cartRepo;

  RemoveFromCartUseCase({required this.cartRepo});

  Future<Either<Faliuer, void>> call(int itemId) async {
    return await cartRepo.removeFromCart(itemId);
  }
}
