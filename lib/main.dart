import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/screens/tasks_screen.dart';
import 'package:to_do_list/utils/constants.dart';

import 'blocs/tasks_bloc.dart';
import 'models/task_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          TasksBloc()..add(AddTask(task: TaskModel(title: 'first task', dueDate: '12/2/2023'))),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          color: Constants.whiteColor,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            fontFamily: 'Inter',
            tabBarTheme: TabBarTheme(
              unselectedLabelColor: Constants.primaryColor,
              labelColor: Constants.whiteColor,
              unselectedLabelStyle: const TextStyle(color: Constants.primaryColor),
              indicatorSize: TabBarIndicatorSize.label,
              labelPadding: const EdgeInsets.symmetric(horizontal: 2),
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Constants.primaryColor,
              ),
            ),
          ),
          home: TasksScreen()),
    );
  }
}
