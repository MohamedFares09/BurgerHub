import 'package:dartz/dartz.dart';
import 'package:hungry_app/core/networking/errors/faliuer.dart';
import 'package:hungry_app/feature/auth/login/domain/entities/user_entity.dart';
import 'package:hungry_app/feature/profile/domain/repo/profile_repo.dart';

class GetUserProfileUseCase {
  final ProfileRepo profileRepo;

  GetUserProfileUseCase({required this.profileRepo});

  Future<Either<Faliuer, UserEntity>> call() async {
    return await profileRepo.getUserProfile();
  }
}
