import 'package:flutter/material.dart';

import 'package:hungry_app/core/constants/app_styles.dart';
import 'package:hungry_app/feature/home/presentation/widget/category_list.dart';
import 'package:hungry_app/feature/home/presentation/widget/header_home_view.dart';
import 'package:hungry_app/feature/home/presentation/widget/search_text_filed.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 70),
          HeaderHomeView(),
          Text('Hello Rich Sonic', style: AppStyles.mediam18),
          SizedBox(height: 18),
          SearchTextFiled(),
          SizedBox(height: 20),
          CategoryList(),
        ],
      ),
    );
  }
}
