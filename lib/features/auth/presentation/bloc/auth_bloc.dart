import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo_app/features/auth/domain/usecases/login_user.dart';
import 'package:flutter_todo_app/features/auth/domain/usecases/register_user.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final RegisterUser _registerUser;
  final LoginUser _loginUser;

  AuthBloc({required RegisterUser registeruser, required LoginUser loginUser})
    : _registerUser = registeruser,
      _loginUser = loginUser,
      super(AuthInitial()) {
    on<AuthEvent>((event, emit) {});

    on<AuthRegisterRequested>(_authRegisterRequested);

    on<AuthLoginRequested>(_authLoginRequested);
  }

  void _authRegisterRequested(
    AuthRegisterRequested event,
    Emitter<AuthState> emit,
  ) async {
    final res = await _registerUser.call(
      RegisterUserParams(
        fullName: event.fullName,
        email: event.email,
        password: event.password,
      ),
    );

    res.fold(
      (failure) => emit(AuthRegisterFailure(message: failure.message)),
      (onRight) => emit(AuthRegisterSuccess()),
    );
  }

  void _authLoginRequested(
    AuthLoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    final res = await _loginUser.call(
      LoginUserParams(email: event.email, password: event.password),
    );

    res.fold(
      (failure) => emit(AuthLoginFailure(message: failure.message)),
      (onRight) => emit(AuthLoginSuccess()),
    );
  }
}
