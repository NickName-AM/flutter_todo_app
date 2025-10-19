import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract interface class AuthLocalDataSource {
  Future<String?> getAccessToken();
  Future<String?> getRefreshToken();

  Future<void> cacheTokens({
    required String accessToken,
    required String refreshToken,
  });
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final FlutterSecureStorage flutterSecureStorage;

  AuthLocalDataSourceImpl({required this.flutterSecureStorage});

  @override
  Future<void> cacheTokens({
    required String accessToken,
    required String refreshToken,
  }) async {
    await flutterSecureStorage.write(key: 'access_token', value: accessToken);
    await flutterSecureStorage.write(key: 'refresh_token', value: refreshToken);
  }

  @override
  Future<String?> getAccessToken() async {
    return await flutterSecureStorage.read(key: 'access_token');
  }

  @override
  Future<String?> getRefreshToken() async {
    return await flutterSecureStorage.read(key: 'refresh_token');
  }
}
