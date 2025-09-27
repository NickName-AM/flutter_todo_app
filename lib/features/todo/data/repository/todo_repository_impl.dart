import 'package:flutter_todo_app/core/errors/exceptions.dart';
import 'package:flutter_todo_app/core/errors/failure.dart';
import 'package:flutter_todo_app/features/todo/data/datasources/todo_remote_data_source.dart';
import 'package:flutter_todo_app/features/todo/data/models/todo_model.dart';
import 'package:flutter_todo_app/features/todo/domain/entities/todo.dart';
import 'package:flutter_todo_app/features/todo/domain/repository/todo_repository.dart';
import 'package:fpdart/fpdart.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoRemoteDataSource todoRemoteDataSource;

  TodoRepositoryImpl({required this.todoRemoteDataSource});

  @override
  Future<Either<Failure, Todo>> createTodo({
    required String title,
    required String date,
    required String startTime,
    required String endTime,
  }) async {
    try {
      TodoModel todoModel = TodoModel(
        title: title,
        date: date,
        startTime: startTime,
        endTime: endTime,
      );

      return right(await todoRemoteDataSource.createTodo(todoModel));
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
