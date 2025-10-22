// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_todo_app/core/errors/failure.dart';
import 'package:flutter_todo_app/core/usecase/usecase.dart';
import 'package:flutter_todo_app/features/todo/domain/repository/todo_repository.dart';
import 'package:fpdart/fpdart.dart';

class DeleteTodo implements Usecase<void, DeleteTodoParams> {
  final TodoRepository todoRepository;

  DeleteTodo({required this.todoRepository});
  @override
  Future<Either<Failure, void>> call(DeleteTodoParams params) async {
    return await todoRepository.deleteTodo(id: params.id);
  }
}

class DeleteTodoParams {
  int id;
  DeleteTodoParams({required this.id});
}
