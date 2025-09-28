import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo_app/core/usecase/usecase.dart';
import 'package:flutter_todo_app/features/todo/domain/entities/todo.dart';
import 'package:flutter_todo_app/features/todo/domain/usecases/create_todo.dart';
import 'package:flutter_todo_app/features/todo/domain/usecases/list_todos.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final CreateTodo _createTodo;
  final ListTodos _listTodos;

  TodoBloc({required CreateTodo createTodo, required ListTodos listTodos})
    : _createTodo = createTodo,
      _listTodos = listTodos,
      super(TodoInitial()) {
    on<TodoCreateRequested>(_onTodoCreateRequested);

    on<TodoListRequested>(_onTodoListRequested);
  }

  void _onTodoCreateRequested(
    TodoCreateRequested event,
    Emitter<TodoState> emit,
  ) async {
    final res = await _createTodo(
      CreateTodoParams(
        title: event.title,
        date: event.date,
        startTime: event.startTime,
        endTime: event.endTime,
      ),
    );

    res.fold(
      (failure) {
        emit(TodoFailure(message: "Failed to create todo."));
      },
      (todo) {
        emit(TodoCreateSuccess(todo: todo));
      },
    );
  }

  void _onTodoListRequested(
    TodoListRequested event,
    Emitter<TodoState> emit,
  ) async {
    final res = await _listTodos(NoParams());

    res.fold(
      (failure) => emit(TodoFailure(message: "Failed to get todos.")),
      (todos) => emit(TodoListSuccess(todos: todos)),
    );
  }
}
