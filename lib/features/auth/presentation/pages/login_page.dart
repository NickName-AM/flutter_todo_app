import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo_app/core/utils/display_snack_bar.dart';
import 'package:flutter_todo_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter_todo_app/features/auth/presentation/pages/signup_page.dart';
import 'package:flutter_todo_app/features/auth/presentation/widgets/auth_text_field.dart';
import 'package:flutter_todo_app/features/auth/presentation/widgets/auth_select_button.dart';
import 'package:flutter_todo_app/features/auth/presentation/widgets/submit_button.dart';
import 'package:flutter_todo_app/features/todo/presentation/pages/home_page.dart';

class LoginPage extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => LoginPage());

  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthLoginSuccess) {
          Navigator.pushAndRemoveUntil(
            context,
            HomePage.route(),
            (route) => false,
          );
        } else if (state is AuthLoginFailure) {
          displaySnackBar(context, state.message);
        }
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30),
                Row(
                  children: [
                    AuthSelectButton(text: "Login", onPressed: null),
                    SizedBox(width: 12),
                    AuthSelectButton(
                      text: "Sign Up",
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          SignupPage.route(),
                          (route) => false,
                        );
                      },
                    ),
                  ],
                ),
                SizedBox(height: 50),
                Icon(
                  Icons.directions_walk,
                  size: 100,
                  color: Color.fromRGBO(9, 14, 178, 1),
                ),
                SizedBox(height: 30),
                Text(
                  'Log in.',
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 50),

                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade200,
                        spreadRadius: 5,
                        blurRadius: 5,
                      ),
                    ],
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      AuthTextField(
                        controller: emailController,
                        hintText: 'Enter Email',
                        icon: Icons.person_outline,
                      ),
                      SizedBox(
                        height: 10,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                          ),
                        ),
                      ),
                      AuthTextField(
                        controller: passwordController,
                        hintText: 'Enter Password',
                        icon: Icons.lock,
                        obscureText: true,
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    context.read<AuthBloc>().add(
                      AuthLoginRequested(
                        email: emailController.text.trim(),
                        password: passwordController.text.trim(),
                      ),
                    );
                  },
                  child: SubmitButton(hintText: 'Login'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
