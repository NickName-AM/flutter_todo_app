import 'package:flutter_todo_app/core/errors/failure.dart';
import 'package:flutter_todo_app/core/usecase/usecase.dart';
import 'package:flutter_todo_app/features/todo/domain/entities/todo.dart';
import 'package:flutter_todo_app/features/todo/domain/repository/todo_repository.dart';
import 'package:fpdart/fpdart.dart';

class CreateTodo implements Usecase<Todo, CreateTodoParams> {
  final TodoRepository todoRepository;

  CreateTodo({required this.todoRepository});

  @override
  Future<Either<Failure, Todo>> call(CreateTodoParams params) async {
    return await todoRepository.createTodo(
      title: params.title,
      date: params.date,
      startTime: params.startTime,
      endTime: params.endTime,
    );
  }
}

class CreateTodoParams {
  final String title;
  final String date;
  final String startTime;
  final String endTime;

  CreateTodoParams({
    required this.title,
    required this.date,
    required this.startTime,
    required this.endTime,
  });
}
