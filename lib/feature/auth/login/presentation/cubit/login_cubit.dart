import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry_app/feature/auth/login/domain/usecaces/user_usecases.dart';
import 'package:hungry_app/feature/auth/login/presentation/cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase loginUseCase;
  LoginCubit(this.loginUseCase) : super(LoginInitial());
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  void login() async {
    if (isClosed) return;
    emit(LoginLoading());
    final result = await loginUseCase(
      email: emailController.text,
      password: passwordController.text,
    );

    if (isClosed) return;

    result.fold(
      (failure) {
        if (!isClosed) {
          emit(LoginError(error: failure.message));
        }
      },
      (user) {
        if (!isClosed) {
          emit(LoginSuccess(user: user));
        }
      },
    );
  }
}
