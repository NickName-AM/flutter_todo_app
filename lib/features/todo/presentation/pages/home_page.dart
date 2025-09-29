import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo_app/features/todo/presentation/bloc/todo_bloc.dart';
import 'package:flutter_todo_app/features/todo/presentation/pages/create_todo_activity.dart';
import 'package:flutter_todo_app/features/todo/presentation/widgets/activity_box.dart';

class HomePage extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => HomePage());
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<TodoBloc>().add(TodoListRequested());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromRGBO(64, 68, 201, 1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              // height: 50,
              padding: const EdgeInsets.symmetric(
                horizontal: 30.0,
                vertical: 60,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Activities",
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    width: 120,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, CreateTodoActivity.route());
                      },
                      style: ButtonStyle(
                        shape: WidgetStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(15),
                          ),
                        ),
                      ),
                      child: Text(
                        'Add New',
                        style: TextStyle(color: Color.fromRGBO(64, 68, 201, 1)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(30)),
                  color: Colors.white,
                ),
                padding: EdgeInsets.all(30),
                // color: Colors.white,
                child: BlocBuilder<TodoBloc, TodoState>(
                  builder: (context, state) {
                    if (state is TodoListSuccess) {
                      return ListView.builder(
                        itemCount: state.todos.length,
                        itemBuilder: (context, index) {
                          return ActivityBox(
                            title: state.todos[index].title,
                            startTime: state.todos[index].startTime,
                            endTime: state.todos[index].endTime,
                          );
                        },
                      );
                    }
                    return const Center(child: Text("No tasks today."));
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
