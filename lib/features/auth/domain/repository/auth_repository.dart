import 'package:flutter_todo_app/core/errors/failure.dart';
import 'package:flutter_todo_app/features/auth/domain/entity/user.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, void>> register({
    required String fullName,
    required String email,
    required String password,
  });
}
