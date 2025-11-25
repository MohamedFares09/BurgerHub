import 'package:hungry_app/feature/auth/login/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.token,
    required super.name,
    required super.email,
    required super.image,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    // Extract data from the nested 'data' object
    final data = json['data'] as Map<String, dynamic>?;

    if (data == null) {
      throw Exception('Invalid response: data field is missing');
    }

    return UserModel(
      token: data['token'] ?? '',
      name: data['name'] ?? '',
      email: data['email'] ?? '',
      image: data['image'] ?? '',
    );
  }
}
