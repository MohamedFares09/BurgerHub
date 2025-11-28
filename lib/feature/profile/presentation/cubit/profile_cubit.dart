import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry_app/feature/profile/domain/usecases/get_user_profile_usecase.dart';
import 'package:hungry_app/feature/profile/presentation/cubit/profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final GetUserProfileUseCase getUserProfileUseCase;

  ProfileCubit(this.getUserProfileUseCase) : super(ProfileInitial());

  Future<void> getUserProfile() async {
    emit(ProfileLoading());

    final result = await getUserProfileUseCase.call();

    result.fold(
      (failure) => emit(ProfileError(message: failure.message)),
      (user) => emit(ProfileSuccess(user: user)),
    );
  }
}
