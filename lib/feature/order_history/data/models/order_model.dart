import 'package:hungry_app/feature/order_history/domain/entities/order_entity.dart';

class OrderModel extends OrderEntity {
  const OrderModel({
    required super.id,
    required super.total,
    required super.status,
    required super.createdAt,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'] as int,
      total: (json['total'] as num).toDouble(),
      status: json['status'] as String? ?? 'pending',
      createdAt:
          json['created_at'] as String? ?? json['createdAt'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'total': total,
      'status': status,
      'created_at': createdAt,
    };
  }
}
