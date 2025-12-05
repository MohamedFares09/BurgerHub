import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry_app/feature/auth/login/domain/usecases/logout_usecase.dart';
import 'package:hungry_app/feature/auth/login/presentation/cubit/logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  final LogoutUseCase logoutUseCase;

  LogoutCubit({required this.logoutUseCase}) : super(LogoutInitial());

  Future<void> logout() async {
    if (isClosed) return;
    emit(LogoutLoading());

    final result = await logoutUseCase();

    if (isClosed) return;

    result.fold(
      (failure) {
        if (!isClosed) {
          emit(LogoutError(message: failure.message));
        }
      },
      (_) {
        if (!isClosed) {
          emit(LogoutSuccess());
        }
      },
    );
  }
}
