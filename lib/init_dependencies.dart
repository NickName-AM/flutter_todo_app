import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_todo_app/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:flutter_todo_app/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:flutter_todo_app/features/auth/data/repository/auth_repository_impl.dart';
import 'package:flutter_todo_app/features/auth/domain/repository/auth_repository.dart';
import 'package:flutter_todo_app/features/auth/domain/usecases/login_user.dart';
import 'package:flutter_todo_app/features/auth/domain/usecases/register_user.dart';
import 'package:flutter_todo_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter_todo_app/features/todo/data/datasources/todo_remote_data_source.dart';
import 'package:flutter_todo_app/features/todo/data/repository/todo_repository_impl.dart';
import 'package:flutter_todo_app/features/todo/domain/repository/todo_repository.dart';
import 'package:flutter_todo_app/features/todo/domain/usecases/create_todo.dart';
import 'package:flutter_todo_app/features/todo/domain/usecases/delete_todo.dart';
import 'package:flutter_todo_app/features/todo/domain/usecases/list_todos.dart';
import 'package:flutter_todo_app/features/todo/presentation/bloc/todo_bloc.dart';
import 'package:get_it/get_it.dart';

import 'package:http/http.dart' as http;

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initTodo();
  _initAuth();

  serviceLocator.registerLazySingleton(() => http.Client());
  serviceLocator.registerLazySingleton(() => FlutterSecureStorage());
}

void _initAuth() {
  serviceLocator
    ..registerFactory<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(client: serviceLocator()),
    )
    ..registerFactory<AuthLocalDataSource>(
      () => AuthLocalDataSourceImpl(flutterSecureStorage: serviceLocator()),
    )
    ..registerFactory<AuthRepository>(
      () => AuthRepositoryImpl(
        authRemoteDataSource: serviceLocator(),
        authLocalDataSource: serviceLocator(),
      ),
    )
    ..registerFactory(() => RegisterUser(authRepository: serviceLocator()))
    ..registerFactory(() => LoginUser(authRepository: serviceLocator()))
    ..registerLazySingleton(
      () =>
          AuthBloc(registeruser: serviceLocator(), loginUser: serviceLocator()),
    );
}

void _initTodo() {
  serviceLocator
    ..registerFactory<TodoRemoteDataSource>(
      () => TodoRemoteDataSourceImpl(
        client: serviceLocator(),
        flutterSecureStorage: serviceLocator(),
      ),
    )
    ..registerFactory<TodoRepository>(
      () => TodoRepositoryImpl(todoRemoteDataSource: serviceLocator()),
    )
    ..registerFactory(() => CreateTodo(todoRepository: serviceLocator()))
    ..registerFactory(() => ListTodos(todoRepository: serviceLocator()))
    ..registerFactory(() => DeleteTodo(todoRepository: serviceLocator()))
    ..registerLazySingleton(
      () => TodoBloc(
        createTodo: serviceLocator(),
        listTodos: serviceLocator(),
        deleteTodo: serviceLocator(),
      ),
    );
}
