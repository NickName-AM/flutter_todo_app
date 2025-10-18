// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_todo_app/core/errors/exceptions.dart';
import 'package:flutter_todo_app/core/errors/failure.dart';
import 'package:flutter_todo_app/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:flutter_todo_app/features/auth/data/model/user_model.dart';
import 'package:flutter_todo_app/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl({required this.authRemoteDataSource});

  @override
  Future<Either<Failure, void>> register({
    required String fullName,
    required String email,
    required String password,
  }) async {
    try {
      UserModel user = UserModel(
        fullName: fullName,
        email: email,
        password: password,
      );
      await authRemoteDataSource.register(user);
      return right(null);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
