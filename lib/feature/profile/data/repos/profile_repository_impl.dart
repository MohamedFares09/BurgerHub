import 'package:dartz/dartz.dart';
import 'package:hungry_app/core/cache/cache_helper.dart';
import 'package:hungry_app/core/networking/errors/exception.dart';
import 'package:hungry_app/core/networking/errors/faliuer.dart';
import 'package:hungry_app/feature/auth/login/domain/entities/user_entity.dart';
import 'package:hungry_app/feature/profile/data/datasources/profile_remote_data_source.dart';
import 'package:hungry_app/feature/profile/domain/repo/profile_repo.dart';

class ProfileRepositoryImpl implements ProfileRepo {
  final ProfileRemoteDataSource remoteDataSource;
  final CacheHelper cacheHelper;

  ProfileRepositoryImpl({
    required this.remoteDataSource,
    required this.cacheHelper,
  });

  @override
  Future<Either<Faliuer, UserEntity>> getUserProfile() async {
    try {
      final user = await remoteDataSource.getUserProfile();

      // Update cache with latest user data
      await cacheHelper.saveUserData(
        name: user.name,
        email: user.email,
        image: user.image,
      );

      return Right(user);
    } on ServerException catch (e) {
      return Left(Faliuer(message: e.errorModel.message ?? "Unknown Error"));
    }
  }

  @override
  Future<Either<Faliuer, UserEntity>> updateUserProfile({
    required String name,
    required String email,
    String? imagePath,
  }) async {
    try {
      final user = await remoteDataSource.updateUserProfile(
        name: name,
        email: email,
        imagePath: imagePath,
      );

      // Update cache with new user data
      await cacheHelper.saveUserData(
        name: user.name,
        email: user.email,
        image: user.image,
      );

      return Right(user);
    } on ServerException catch (e) {
      return Left(Faliuer(message: e.errorModel.message ?? "Unknown Error"));
    }
  }
}
