import 'package:flutter/material.dart';
import 'package:flutter_todo_app/features/auth/presentation/pages/login_page.dart';
import 'package:flutter_todo_app/features/auth/presentation/widgets/auth_text_field.dart';
import 'package:flutter_todo_app/features/auth/presentation/widgets/auth_select_button.dart';
import 'package:flutter_todo_app/features/auth/presentation/widgets/submit_button.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                AuthSelectButton(
                  text: "Login",
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                      (route) => false,
                    );
                  },
                ),
                SizedBox(width: 12),
                AuthSelectButton(text: "Sign Up", onPressed: null),
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
              'Sign up.',
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
                    controller: nameController,
                    hintText: 'Your name',
                    icon: Icons.man,
                  ),
                  SizedBox(
                    height: 10,
                    child: Container(
                      decoration: BoxDecoration(color: Colors.grey.shade200),
                    ),
                  ),
                  AuthTextField(
                    controller: emailController,
                    hintText: 'Enter Email',
                    icon: Icons.person_outline,
                  ),
                  SizedBox(
                    height: 10,
                    child: Container(
                      decoration: BoxDecoration(color: Colors.grey.shade200),
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
              onTap: () {},
              child: SubmitButton(hintText: 'Register'),
            ),
          ],
        ),
      ),
    );
  }
}
