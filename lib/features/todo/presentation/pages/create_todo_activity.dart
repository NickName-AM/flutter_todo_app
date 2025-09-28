// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo_app/features/todo/presentation/bloc/todo_bloc.dart';
import 'package:flutter_todo_app/features/todo/presentation/widgets/simple_text_field.dart';
import 'package:flutter_todo_app/features/todo/presentation/widgets/time_picker.dart';
import 'package:intl/intl.dart';

class CreateTodoActivity extends StatefulWidget {
  CreateTodoActivity({Key? key}) : super(key: key);

  @override
  State<CreateTodoActivity> createState() => _CreateTodoActivityState();
}

class _CreateTodoActivityState extends State<CreateTodoActivity> {
  final titleController = TextEditingController();
  final startTimeController = TextEditingController();
  final endTimeController = TextEditingController();

  DateTime _selectedDate = DateTime.now();

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
              child: Text(
                "Create Todo",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
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
                child: SingleChildScrollView(
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 16),
                        SimpleTextField(
                          titleController: titleController,
                          hintText: "Title",
                        ),
                        SizedBox(height: 30),
                        Theme(
                          data: Theme.of(context).copyWith(
                            colorScheme: ColorScheme.light(
                              primary: Color.fromRGBO(64, 68, 201, 1),
                              onPrimary: Colors.blue,
                              onSurface: Colors.black,
                            ),
                          ),
                          child: CalendarDatePicker(
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2100),
                            onDateChanged: (date) {
                              _selectedDate = date;
                            },
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TimePicker(
                              text: "Start Time",
                              timeController: startTimeController,
                            ),
                            SizedBox(width: 20),
                            TimePicker(
                              text: "End time",
                              timeController: endTimeController,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, bottom: 30),
          child: SizedBox(
            width: double.infinity,
            child: FloatingActionButton(
              onPressed: () {
                context.read<TodoBloc>().add(
                  TodoCreateRequested(
                    title: titleController.text,
                    date: DateFormat('yyyy-MM-dd').format(_selectedDate),
                    startTime: startTimeController.text,
                    endTime: endTimeController.text,
                  ),
                );
              },
              foregroundColor: Colors.white,
              backgroundColor: Color.fromRGBO(64, 68, 201, 1),
              child: Text("Create"),
            ),
          ),
        ),
      ),
    );
  }
}
