import 'package:hungry_app/feature/auth/login/domain/entities/user_entity.dart';

sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginSuccess extends LoginState {
  final UserEntity user;

  LoginSuccess({required this.user});
}

final class LoginError extends LoginState {
  final String error;

  LoginError({required this.error});
}
