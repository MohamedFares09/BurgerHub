  import 'package:flutter/cupertino.dart';
  import 'package:flutter_bloc/flutter_bloc.dart';
  import 'package:hungry_app/core/networking/api/api_consumer.dart';
  import 'package:hungry_app/core/networking/api/end_points.dart';
  import 'package:hungry_app/core/networking/errors/exception.dart';
  import 'package:hungry_app/feature/auth/login/presentation/cubit/login_state.dart';

  class LoginCubit extends Cubit<LoginState> {
    final ApiConsumer api;
    LoginCubit(this.api) : super(LoginInitial());
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    void login() async {
      try {
        emit(LoginLoading());
        final response = await api.post(
          EndPoints.login,
          data: {
            "email": emailController.text,
            "password": passwordController.text,
          },
        );
        emit(LoginSuccess());
      } on ServerException catch (e) {
        emit(LoginError(error: e.errorModel.message ?? "Error"));
      }
    }
  }
