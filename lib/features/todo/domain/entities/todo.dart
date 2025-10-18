// ignore_for_file: public_member_api_docs, sort_constructors_first
class Todo {
  final String? id;
  final String title;
  final String date;
  final String startTime;
  final String endTime;

  Todo({
    this.id,
    required this.title,
    required this.date,
    required this.startTime,
    required this.endTime,
  });
}
