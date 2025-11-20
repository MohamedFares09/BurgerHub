
import 'package:flutter/material.dart';
import 'package:hungry_app/core/constants/app_styles.dart';

class OrderSummaryRow extends StatelessWidget {
  const OrderSummaryRow({
    super.key,
    required this.name,
    required this.price,
    this.style,
  });
  final String name;
  final num price;
  final TextStyle? style;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      child: Row(
        children: [
          Text(name, style: style ?? AppStyles.regular18),
          Spacer(),
          Text('$price \$', style: style ?? AppStyles.regular18),
        ],
      ),
    );
  }
}
