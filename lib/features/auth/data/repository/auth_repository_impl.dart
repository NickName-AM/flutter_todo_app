// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_todo_app/core/errors/exceptions.dart';
import 'package:flutter_todo_app/core/errors/failure.dart';
import 'package:flutter_todo_app/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:flutter_todo_app/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:flutter_todo_app/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;
  final AuthLocalDataSource authLocalDataSource;

  AuthRepositoryImpl({
    required this.authRemoteDataSource,
    required this.authLocalDataSource,
  });

  @override
  Future<Either<Failure, void>> register({
    required String fullName,
    required String email,
    required String password,
  }) async {
    try {
      await authRemoteDataSource.register(
        fullName: fullName,
        email: email,
        password: password,
      );
      return right(null);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, void>> login({
    required String email,
    required String password,
  }) async {
    try {
      final tokens = await authRemoteDataSource.login(
        email: email,
        password: password,
      );

      return right(
        await authLocalDataSource.cacheTokens(
          accessToken: tokens['access'],
          refreshToken: tokens['refresh'],
        ),
      );
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
