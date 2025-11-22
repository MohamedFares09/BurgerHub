import 'package:dartz/dartz.dart';
import 'package:hungry_app/core/networking/errors/faliuer.dart';
import 'package:hungry_app/feature/auth/login/doman/entities/user_entity.dart';

abstract class UserRepo {
Future<Either<Faliuer , UserEntity>>  login();
}
