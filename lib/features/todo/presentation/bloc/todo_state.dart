part of 'todo_bloc.dart';

@immutable
sealed class TodoState {}

final class TodoInitial extends TodoState {}

final class TodoLoading extends TodoState {}

final class TodoCreateSuccess extends TodoState {
  final Todo todo;

  TodoCreateSuccess({required this.todo});
}

final class TodoFailure extends TodoState {
  final String message;

  TodoFailure({required this.message});
}
