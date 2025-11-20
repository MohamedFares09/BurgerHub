import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/core/constants/app_image.dart';
import 'package:hungry_app/core/widgets/custom_button.dart';
import 'package:hungry_app/core/widgets/custom_text_filed.dart';
import 'package:hungry_app/feature/auth/register/presentation/widget/do_you_have_an_account.dart';

class RegisterViewBody extends StatelessWidget {
  RegisterViewBody({super.key});
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(height: 250),
          SvgPicture.asset(
            Assets.svgTextSplashImage,
            color: AppColors.primaryColor,
          ),
          SizedBox(height: 120),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),

              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 100),
                      CustomTextFiled(
                        hintText: "Enter Name",
                        controller: nameController,
                      ),
                      SizedBox(height: 20),
                      CustomTextFiled(
                        hintText: "Enter email",
                        controller: emailController,
                      ),
                      SizedBox(height: 20),
                      CustomTextFiled(
                        hintText: "Enter password",
                        controller: passwordController,
                        obscureText: true,
                      ),
                      SizedBox(height: 20),
                      CustomButton(
                        text: 'Register',
                        backGroundColor: Colors.white,
                        color: AppColors.primaryColor,
                        width: double.infinity,
                      ),
                      SizedBox(height: 20),
                      DoYouHaveAnAccount(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
