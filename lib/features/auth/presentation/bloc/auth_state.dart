part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthRegisterSuccess extends AuthState {}

final class AuthRegisterFailure extends AuthState {
  final String message;

  AuthRegisterFailure({required this.message});
}

final class AuthLoginSuccess extends AuthState {}

final class AuthLoginFailure extends AuthState {
  final String message;

  AuthLoginFailure({required this.message});
}
