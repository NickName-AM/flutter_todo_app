import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo_app/features/auth/domain/usecases/register_user.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final RegisterUser _registerUser;

  AuthBloc({required RegisterUser registeruser})
    : _registerUser = registeruser,
      super(AuthInitial()) {
    on<AuthEvent>((event, emit) {});

    on<AuthRegisterRequested>(_userRegisterRequested);
  }

  void _userRegisterRequested(
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

    res.fold((failure) => emit(AuthRegisterFailure(message: failure.message)), (
      onRight,
    ) {
      print("Success");
      emit(AuthRegisterSuccess());
    });
  }
}
