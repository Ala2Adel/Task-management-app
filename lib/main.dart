import 'package:flutter/material.dart';
import 'package:to_do_list/app_colors.dart';
import 'package:to_do_list/screens/tasks_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        color: AppColors.white,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'Inter',
          tabBarTheme: TabBarTheme(
            unselectedLabelColor: AppColors.green,
            labelColor: AppColors.white,
            unselectedLabelStyle: const TextStyle(color: AppColors.green),
            indicatorSize: TabBarIndicatorSize.label,
            labelPadding: EdgeInsets.symmetric(horizontal: 2),
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.green,
            ),
          ),
        ),
        home: TasksScreen());
  }
}
