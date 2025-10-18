// ignore_for_file: public_member_api_docs, sort_constructors_first
class User {
  final String? id;
  final String fullName;
  final String email;
  final String? password;

  User({this.id, required this.fullName, required this.email, this.password});
}
