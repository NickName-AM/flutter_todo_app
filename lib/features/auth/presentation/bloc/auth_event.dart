part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

final class AuthRegisterRequested extends AuthEvent {
  final String fullName;
  final String email;
  final String password;

  AuthRegisterRequested({
    required this.fullName,
    required this.email,
    required this.password,
  });
}
