import 'package:hungry_app/core/networking/api/api_consumer.dart';
import 'package:hungry_app/core/networking/api/end_points.dart';
import 'package:hungry_app/feature/order_history/data/models/create_order_request.dart';

abstract class OrderRemoteDataSource {
  Future<void> createOrder(CreateOrderRequest request);
}

class OrderRemoteDataSourceImpl implements OrderRemoteDataSource {
  final ApiConsumer api;

  OrderRemoteDataSourceImpl({required this.api});

  @override
  Future<void> createOrder(CreateOrderRequest request) async {
    await api.post(EndPoints.saveOrder, data: request.toJson());
  }
}
