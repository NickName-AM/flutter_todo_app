import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter_todo_app/features/auth/presentation/pages/login_page.dart';
import 'package:flutter_todo_app/features/auth/presentation/pages/signup_page.dart';

import 'package:flutter_todo_app/features/todo/presentation/bloc/todo_bloc.dart';
import 'package:flutter_todo_app/features/todo/presentation/pages/home_page.dart';
import 'package:flutter_todo_app/init_dependencies.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initDependencies();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => serviceLocator<TodoBloc>()),
        BlocProvider(create: (_) => serviceLocator<AuthBloc>()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: LoginPage(),
      // home: HomePage(),
    );
  }
}
