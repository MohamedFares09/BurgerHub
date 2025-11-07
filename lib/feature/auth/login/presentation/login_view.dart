import 'package:flutter/material.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/feature/auth/login/presentation/widget/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const routeName = 'login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      resizeToAvoidBottomInset: true, // مهم لتجنب انكماش الواجهة مع الكيبورد
      body: GestureDetector(
        onTap: () {
          // هتقفل الكيبورد فقط لو المستخدم ضغط في أي مكان فاضي
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: LoginViewBody(),
      ),
    );
  }
}
