class CreateOrderRequest {
  final List<OrderItemRequest> items;

  CreateOrderRequest({required this.items});

  Map<String, dynamic> toJson() {
    return {'items': items.map((item) => item.toJson()).toList()};
  }
}

class OrderItemRequest {
  final int productId;
  final int quantity;
  final double spicy;
  final List<int> toppings;
  final List<int> sideOptions;

  OrderItemRequest({
    required this.productId,
    required this.quantity,
    required this.spicy,
    required this.toppings,
    required this.sideOptions,
  });

  Map<String, dynamic> toJson() {
    return {
      'product_id': productId,
      'quantity': quantity,
      'spicy': spicy,
      'toppings': toppings,
      'side_options': sideOptions,
    };
  }
}
