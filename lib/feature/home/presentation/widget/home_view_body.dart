import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/core/constants/app_image.dart';
import 'package:hungry_app/core/constants/app_styles.dart';
import 'package:hungry_app/feature/home/presentation/widget/search_text_filed.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 70),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Row(
            children: [
              SvgPicture.asset(
                Assets.svgTextSplashImage,
                color: AppColors.primaryColor,
              ),
              Spacer(),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                ),
                height: 60,
                width: 60,
                child: Image.asset(
                  'assets/images/sonic_image.png',
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 18),
          child: Text('Hello Rich Sonic', style: AppStyles.mediam18),
        ),
        SizedBox(height: 18),
        SearchTextFiled(),
      ],
    );
  }
}
