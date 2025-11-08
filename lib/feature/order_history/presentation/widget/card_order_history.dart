
import 'package:flutter/material.dart';
import 'package:hungry_app/core/constants/app_colors.dart' show AppColors;
import 'package:hungry_app/core/widgets/custom_button.dart';

class CardOrederHistory extends StatelessWidget {
  const CardOrederHistory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8.0,
            vertical: 4.0,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset('assets/images/image_test.png', height: 100),
                  Spacer(),
                  Column(
                    children: [
                      Text(
                        'Hamburger',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text('\$200'),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              CustomButton(
                text: 'Re Order',
                color: Colors.white,
                backGroundColor: AppColors.primaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
