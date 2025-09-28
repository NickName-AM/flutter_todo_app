import 'dart:convert';

import 'package:flutter_todo_app/core/endpoint.dart';
import 'package:flutter_todo_app/core/errors/exceptions.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_todo_app/features/todo/data/models/todo_model.dart';

abstract interface class TodoRemoteDataSource {
  Future<TodoModel> createTodo(TodoModel todo);
  Future<List<TodoModel>> getAllTodos();
}

class TodoRemoteDataSourceImpl implements TodoRemoteDataSource {
  final http.Client client;

  TodoRemoteDataSourceImpl({required this.client});

  @override
  Future<TodoModel> createTodo(TodoModel todo) async {
    final url = Uri.parse("${Endpoint.endpoint}/todo/create/");
    try {
      final response = await client.post(
        url,
        headers: {'Content-Type': 'application/json'},
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
      final res = await client.get(url);

      final todoMapList = json.decode(res.body) as List;

      return todoMapList.map((e) => TodoModel.fromMap(e)).toList();
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
