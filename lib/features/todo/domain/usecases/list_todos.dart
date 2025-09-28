import 'package:flutter_todo_app/core/errors/failure.dart';
import 'package:flutter_todo_app/core/usecase/usecase.dart';
import 'package:flutter_todo_app/features/todo/domain/entities/todo.dart';
import 'package:flutter_todo_app/features/todo/domain/repository/todo_repository.dart';
import 'package:fpdart/fpdart.dart';

class ListTodos implements Usecase<List<Todo>, NoParams> {
  final TodoRepository todoRepository;

  ListTodos({required this.todoRepository});
  @override
  Future<Either<Failure, List<Todo>>> call(NoParams params) {
    return todoRepository.getAllTodos();
  }
}
