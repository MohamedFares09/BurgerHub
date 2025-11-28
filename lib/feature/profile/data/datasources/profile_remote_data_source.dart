import 'package:hungry_app/core/networking/api/api_consumer.dart';
import 'package:hungry_app/core/networking/api/end_points.dart';
import 'package:hungry_app/feature/auth/login/data/model/user_model.dart';

abstract class ProfileRemoteDataSource {
  Future<UserModel> getUserProfile();
}

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final ApiConsumer api;

  ProfileRemoteDataSourceImpl({required this.api});

  @override
  Future<UserModel> getUserProfile() async {
    final response = await api.get(EndPoints.profile);
    return UserModel.fromJson(response['data']);
  }
}
