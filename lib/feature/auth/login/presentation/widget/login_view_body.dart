import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/core/constants/app_image.dart';
import 'package:hungry_app/core/widgets/custom_button.dart';
import 'package:hungry_app/core/widgets/custom_text_filed.dart';
import 'package:hungry_app/feature/auth/login/presentation/cubit/login_cubit.dart';
import 'package:hungry_app/feature/auth/login/presentation/cubit/login_state.dart';
import 'package:hungry_app/feature/auth/login/presentation/widget/do_not_have_an_account.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<LoginCubit>();
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text("Login Successfully")));
        }
        if (state is LoginError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.error)));
        }
      },
      builder: (context, state) {
        return Form(
          key: cubit.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 250),
              SvgPicture.asset(
                Assets.svgTextSplashImage,
                color: AppColors.primaryColor,
              ),
              SizedBox(height: 10),
              const Text(
                "Welcome Back to Hungry App",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor,
                ),
              ),
              SizedBox(height: 100),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
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
                          const SizedBox(height: 100),
                          CustomTextFiled(
                            hintText: 'Email',
                            controller: cubit.emailController,
                          ),
                          const SizedBox(height: 20),
                          CustomTextFiled(
                            obscureText: true,
                            hintText: 'Password',
                            controller: cubit.passwordController,
                          ),
                          const SizedBox(height: 16),
                          BlocBuilder<LoginCubit, LoginState>(
                            builder: (context, state) {
                              if (state is LoginLoading) {
                                return const CircularProgressIndicator();
                              }
                              return CustomButton(
                                text: "Login",
                                backGroundColor: Colors.white,
                                color: AppColors.primaryColor,
                                onTap: () {
                                  if (cubit.formKey.currentState!.validate()) {
                                    cubit.login();
                                  } 
                                },
                                width: double.infinity,
                              );
                            },
                          ),
                          const SizedBox(height: 30),
                          const DoNoHaveAnAccount(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
