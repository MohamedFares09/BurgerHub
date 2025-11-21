import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry_app/core/networking/api/dio_consumer.dart';
import 'package:hungry_app/feature/auth/login/presentation/cubit/login_cubit.dart';
import 'package:hungry_app/feature/auth/login/presentation/widget/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const routeName = 'login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: BlocProvider(
          create: (context) => LoginCubit(DioConsumer(Dio())),
          child: LoginViewBody(),
        ),
      ),
    );
  }
}
