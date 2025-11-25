import 'package:dartz/dartz.dart';
import 'package:hungry_app/core/networking/errors/faliuer.dart';
import 'package:hungry_app/feature/home/doman/entities/home_entity.dart';
import 'package:hungry_app/feature/home/doman/repo/home_repo.dart';

class HomeUsecases {
  final HomeRepo homeRepo;

  HomeUsecases({required this.homeRepo});

  Future<Either<Faliuer, List<HomeEntity>>> getHomeData() async {
    return await homeRepo.getHomeData();
  }
}
