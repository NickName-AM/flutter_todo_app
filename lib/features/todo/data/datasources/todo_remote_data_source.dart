// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_todo_app/core/endpoint.dart';
import 'package:flutter_todo_app/core/errors/exceptions.dart';
import 'package:flutter_todo_app/features/todo/data/models/todo_model.dart';
import 'package:http/http.dart' as http;

abstract interface class TodoRemoteDataSource {
  Future<TodoModel> createTodo(TodoModel todo);
  Future<List<TodoModel>> getAllTodos();
}

class TodoRemoteDataSourceImpl implements TodoRemoteDataSource {
  final http.Client client;
  final FlutterSecureStorage flutterSecureStorage;

  TodoRemoteDataSourceImpl({
    required this.client,
    required this.flutterSecureStorage,
  });

  @override
  Future<TodoModel> createTodo(TodoModel todo) async {
    final url = Uri.parse("${Endpoint.endpoint}/todo/create/");
    try {
      final accessToken = await flutterSecureStorage.read(key: 'access_token');
      if (accessToken == null) {
        throw ServerException(
          "User is not logged in. ('access_token' is missing.)",
        );
      }

      final response = await client.post(
        url,
        headers: {
          'Authorization': 'Bearer $accessToken',
          'Content-Type': 'application/json',
        },
        body: todo.toJson(),
      );

      return TodoModel.fromJson(response.body);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<List<TodoModel>> getAllTodos() async {
    final url = Uri.parse("${Endpoint.endpoint}/todo/list/");
    try {
      final accessToken = await flutterSecureStorage.read(key: 'access_token');
      if (accessToken == null) {
        throw ServerException(
          "User is not logged in. ('access_token' is missing.)",
        );
      }

      final res = await client.get(
        url,
        headers: {'Authorization': 'Bearer $accessToken'},
      );

      final todoMapList = json.decode(res.body) as List;

      return todoMapList.map((e) => TodoModel.fromMap(e)).toList();
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
