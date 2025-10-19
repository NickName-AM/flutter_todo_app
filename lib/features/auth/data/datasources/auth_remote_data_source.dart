import 'dart:convert';

import 'package:flutter_todo_app/core/endpoint.dart';
import 'package:flutter_todo_app/core/errors/exceptions.dart';
import 'package:flutter_todo_app/features/auth/data/model/user_model.dart';
import 'package:http/http.dart' as http;

abstract interface class AuthRemoteDataSource {
  Future<void> register({
    required String fullName,
    required String email,
    required String password,
  });
  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  });
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final http.Client client;

  AuthRemoteDataSourceImpl({required this.client});

  @override
  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    final url = Uri.parse("${Endpoint.endpoint}/users/token/");

    try {
      final res = await client.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({"email": email, "password": password}),
      );

      if (res.statusCode == 200) {
        final tokens = jsonDecode(res.body);
        return tokens;
      } else {
        throw ServerException('Login failed: ${res.body}');
      }
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<void> register({
    required String fullName,
    required String email,
    required String password,
  }) async {
    final url = Uri.parse("${Endpoint.endpoint}/users/register/");
    try {
      final res = await client.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: UserModel(
          fullName: fullName,
          email: email,
          password: password,
        ).toJson(),
      );

      if (res.statusCode != 201) {
        throw ServerException(res.body.toString());
      }
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
