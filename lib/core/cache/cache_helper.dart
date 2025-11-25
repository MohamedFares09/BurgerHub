import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  final SharedPreferences sharedPreferences;

  CacheHelper({required this.sharedPreferences});

  // Keys for storing data
  static const String _tokenKey = 'auth_token';
  static const String _nameKey = 'user_name';
  static const String _emailKey = 'user_email';
  static const String _imageKey = 'user_image';

  // Save token
  Future<bool> saveToken(String token) async {
    return await sharedPreferences.setString(_tokenKey, token);
  }

  // Get token
  String? getToken() {
    return sharedPreferences.getString(_tokenKey);
  }

  // Save user data
  Future<bool> saveUserData({
    required String name,
    required String email,
    required String image,
  }) async {
    final results = await Future.wait([
      sharedPreferences.setString(_nameKey, name),
      sharedPreferences.setString(_emailKey, email),
      sharedPreferences.setString(_imageKey, image),
    ]);
    return results.every((result) => result);
  }

  // Get user name
  String? getUserName() {
    return sharedPreferences.getString(_nameKey);
  }

  // Get user email
  String? getUserEmail() {
    return sharedPreferences.getString(_emailKey);
  }

  // Get user image
  String? getUserImage() {
    return sharedPreferences.getString(_imageKey);
  }

  // Clear all user data (for logout)
  Future<bool> clearUserData() async {
    final results = await Future.wait([
      sharedPreferences.remove(_tokenKey),
      sharedPreferences.remove(_nameKey),
      sharedPreferences.remove(_emailKey),
      sharedPreferences.remove(_imageKey),
    ]);
    return results.every((result) => result);
  }

  // Check if user is logged in
  bool isLoggedIn() {
    return sharedPreferences.containsKey(_tokenKey);
  }
}
