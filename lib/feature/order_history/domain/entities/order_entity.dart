class OrderEntity {
  final int id;
  final double total;
  final String status;
  final String createdAt;

  const OrderEntity({
    required this.id,
    required this.total,
    required this.status,
    required this.createdAt,
  });
}
