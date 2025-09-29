import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo_app/features/todo/data/datasources/todo_remote_data_source.dart';
import 'package:flutter_todo_app/features/todo/data/repository/todo_repository_impl.dart';
import 'package:flutter_todo_app/features/todo/domain/usecases/create_todo.dart';
import 'package:flutter_todo_app/features/todo/domain/usecases/list_todos.dart';
import 'package:flutter_todo_app/features/todo/presentation/bloc/todo_bloc.dart';
import 'package:flutter_todo_app/features/todo/presentation/pages/home_page.dart';
import 'package:http/http.dart' as http;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoBloc(
        createTodo: CreateTodo(
          todoRepository: TodoRepositoryImpl(
            todoRemoteDataSource: TodoRemoteDataSourceImpl(
              client: http.Client(),
            ),
          ),
        ),
        listTodos: ListTodos(
          todoRepository: TodoRepositoryImpl(
            todoRemoteDataSource: TodoRemoteDataSourceImpl(
              client: http.Client(),
            ),
          ),
        ),
      ),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Todo App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        ),
        home: HomePage(),
      ),
    );
  }
}
