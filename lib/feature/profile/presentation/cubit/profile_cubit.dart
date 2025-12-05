import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry_app/feature/profile/domain/usecases/get_user_profile_usecase.dart';
import 'package:hungry_app/feature/profile/domain/usecases/update_user_profile_usecase.dart';
import 'package:hungry_app/feature/profile/presentation/cubit/profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final GetUserProfileUseCase getUserProfileUseCase;
  final UpdateUserProfileUseCase updateUserProfileUseCase;

  ProfileCubit(this.getUserProfileUseCase, this.updateUserProfileUseCase)
    : super(ProfileInitial());

  Future<void> getUserProfile() async {
    if (isClosed) return;
    emit(ProfileLoading());

    final result = await getUserProfileUseCase.call();

    if (isClosed) return;

    result.fold(
      (failure) {
        if (!isClosed) {
          emit(ProfileError(message: failure.message));
        }
      },
      (user) {
        if (!isClosed) {
          emit(ProfileSuccess(user: user));
        }
      },
    );
  }

  Future<void> updateUserProfile({
    required String name,
    required String email,
    String? imagePath,
  }) async {
    if (isClosed) return;
    emit(ProfileUpdating());

    final result = await updateUserProfileUseCase.call(
      name: name,
      email: email,
      imagePath: imagePath,
    );

    if (isClosed) return;

    result.fold(
      (failure) {
        if (!isClosed) {
          emit(ProfileUpdateError(message: failure.message));
        }
      },
      (user) {
        if (!isClosed) {
          emit(ProfileUpdateSuccess(user: user));
        }
      },
    );
  }
}
