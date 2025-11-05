import 'package:flutter/material.dart';
import 'package:hungry_app/feature/product/presentation/widget/details_product_and_spacy_slider.dart';

class ProductDetailsViewBody extends StatelessWidget {
  const ProductDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/images/product_details_view_image.png'),
            const SizedBox(width: 50),
            DetailsProductAndSpacySlider(),
            SizedBox(width: 8),
          ],
        ),
      ],
    );
  }
}
