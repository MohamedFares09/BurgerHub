import 'package:flutter/material.dart';
import 'package:hungry_app/core/cache/cache_helper.dart';
import 'package:hungry_app/core/di/di.dart';
import 'package:hungry_app/feature/auth/login/presentation/login_view.dart';
import 'package:hungry_app/root.dart';

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
      if (!mounted) return;
      final isLoggedIn = getIt<CacheHelper>().isLoggedIn();

      Navigator.pushNamedAndRemoveUntil(
        context,
        isLoggedIn ? Root.routeName : LoginView.routeName,
        (route) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 300),
        Center(
          child: Text(
            'Burger Hub',
            style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontFamily: 'LuckiestGuy',
            ),
          ),
        ),
        Spacer(),
        Image.asset('assets/images/splash_image.png'),
      ],
    );
  }
}
