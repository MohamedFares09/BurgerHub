import 'package:flutter/material.dart';
import 'package:hungry_app/feature/product/presentation/widget/product_details_view_body.dart';

class ProductDatailsView extends StatelessWidget {
  const ProductDatailsView({super.key});
  static const routeName = 'product details view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(), body: ProductDetailsViewBody());
  }
}
