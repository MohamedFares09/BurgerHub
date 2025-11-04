import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/core/constants/app_image.dart';
import 'package:hungry_app/core/constants/app_styles.dart';
import 'package:hungry_app/feature/home/presentation/widget/search_text_filed.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  List category = ['All', 'Combos', 'Sliders', 'Classic'];
  int currentindex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 70),
          Row(
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
          Text('Hello Rich Sonic', style: AppStyles.mediam18),
          SizedBox(height: 18),
          SearchTextFiled(),
          SizedBox(height: 20),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(category.length, (index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        currentindex = index;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 27,
                        vertical: 15,
                      ),
                      decoration: BoxDecoration(
                        color: currentindex == index
                            ? AppColors.primaryColor
                            : Color(0xffF3F4F6),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Text(
                        category[index],
                        style: TextStyle(
                          color: currentindex == index
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
