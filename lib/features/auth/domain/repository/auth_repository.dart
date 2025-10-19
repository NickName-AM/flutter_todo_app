import 'package:flutter_todo_app/core/errors/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, void>> register({
    required String fullName,
    required String email,
    required String password,
  });

  Future<Either<Failure, void>> login({
    required String email,
    required String password,
  });
}
