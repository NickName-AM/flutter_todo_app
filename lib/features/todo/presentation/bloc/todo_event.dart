part of 'todo_bloc.dart';

@immutable
sealed class TodoEvent {}

class TodoCreateRequested extends TodoEvent {
  final String title;
  final String date;
  final String startTime;
  final String endTime;

  TodoCreateRequested({
    required this.title,
    required this.date,
    required this.startTime,
    required this.endTime,
  });
}
