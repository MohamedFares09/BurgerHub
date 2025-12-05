import 'package:dartz/dartz.dart';
import 'package:hungry_app/core/networking/errors/faliuer.dart';
import 'package:hungry_app/feature/order_history/data/models/create_order_request.dart';
import 'package:hungry_app/feature/order_history/domain/repos/order_repo.dart';

class CreateOrderUseCase {
  final OrderRepo orderRepo;

  CreateOrderUseCase({required this.orderRepo});

  Future<Either<Faliuer, void>> call(CreateOrderRequest request) async {
    return await orderRepo.createOrder(request);
  }
}
