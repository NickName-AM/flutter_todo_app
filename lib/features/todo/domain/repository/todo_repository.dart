import 'package:flutter_todo_app/core/errors/failure.dart';
import 'package:flutter_todo_app/features/todo/domain/entities/todo.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class TodoRepository {
  Future<Either<Failure, Todo>> createTodo({
    required String title,
    required String date,
    required String startTime,
    required String endTime,
  });
}
