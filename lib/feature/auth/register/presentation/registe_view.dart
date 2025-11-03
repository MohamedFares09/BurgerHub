import 'package:flutter/material.dart';
import 'package:hungry_app/feature/auth/register/presentation/widget/register_view_body.dart';

class RegisteView extends StatelessWidget {
  const RegisteView({super.key});
  static const routeName = 'register';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RegisterViewBody(),
    );
  }
}
