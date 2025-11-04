import 'package:flutter/material.dart';
import 'package:hungry_app/feature/home/presentation/widget/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const routeName = 'homeview';
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(body: HomeViewBody()),
    );
  }
}
