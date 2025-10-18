import 'package:flutter_todo_app/core/errors/failure.dart';
import 'package:flutter_todo_app/core/usecase/usecase.dart';
import 'package:flutter_todo_app/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class RegisterUser implements Usecase<void, RegisterUserParams> {
  final AuthRepository authRepository;

  RegisterUser({required this.authRepository});

  @override
  Future<Either<Failure, void>> call(RegisterUserParams params) async {
    return authRepository.register(
      fullName: params.fullName,
      email: params.email,
      password: params.password,
    );
  }
}

class RegisterUserParams {
  final String fullName;
  final String email;
  final String password;

  RegisterUserParams({
    required this.fullName,
    required this.email,
    required this.password,
  });
}
