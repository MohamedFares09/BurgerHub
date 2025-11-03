import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hungry_app/core/constants/app_image.dart';
import 'package:hungry_app/feature/home/presentation/home_view.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    navigatorToNextView();
    super.initState();
  }

  void navigatorToNextView() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, HomeView.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 300),
        Center(child: SvgPicture.asset(Assets.svgTextSplashImage)),
        Spacer(),
        Image.asset('assets/images/splash_image.png'),
      ],
    );
  }
}
