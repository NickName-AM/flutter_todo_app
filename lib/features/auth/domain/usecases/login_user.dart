import 'package:flutter_todo_app/core/errors/failure.dart';
import 'package:flutter_todo_app/core/usecase/usecase.dart';
import 'package:flutter_todo_app/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/src/either.dart';

class LoginUser implements Usecase<void, LoginUserParams> {
  final AuthRepository authRepository;

  LoginUser({required this.authRepository});

  @override
  Future<Either<Failure, void>> call(LoginUserParams params) async {
    return await authRepository.login(
      email: params.email,
      password: params.password,
    );
  }
}

class LoginUserParams {
  final String email;
  final String password;

  LoginUserParams({required this.email, required this.password});
}
