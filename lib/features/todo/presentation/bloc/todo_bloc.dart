import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo_app/features/todo/domain/entities/todo.dart';
import 'package:flutter_todo_app/features/todo/domain/usecases/create_todo.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final CreateTodo _createTodo;

  TodoBloc({required CreateTodo createTodo})
    : _createTodo = createTodo,
      super(TodoInitial()) {
    on<TodoCreateRequested>(_onTodoCreateRequested);
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
      (failure) => emit(TodoFailure(message: "Failed to create todo.")),
      (todo) => emit(TodoCreateSuccess(todo: todo)),
    );
  }
}
