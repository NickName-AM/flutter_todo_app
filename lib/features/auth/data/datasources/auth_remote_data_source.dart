import 'package:flutter_todo_app/core/endpoint.dart';
import 'package:flutter_todo_app/core/errors/exceptions.dart';
import 'package:flutter_todo_app/features/auth/data/model/user_model.dart';
import 'package:http/http.dart' as http;

abstract interface class AuthRemoteDataSource {
  Future<void> register(UserModel user);
  Future<bool> login(UserModel user);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final http.Client client;

  AuthRemoteDataSourceImpl({required this.client});

  @override
  Future<bool> login(UserModel user) {
    throw UnimplementedError();
  }

  @override
  Future<void> register(UserModel user) async {
    final url = Uri.parse("${Endpoint.endpoint}/users/register/");
    try {
      final res = await client.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: UserModel(
          fullName: user.fullName,
          email: user.email,
          password: user.password,
        ).toJson(),
      );

      if (res.statusCode != 201) {
        throw Exception(res.body.toString());
      }
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
