import 'package:flutter/material.dart';

import '../app_colors.dart';
import '../widgets/task.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({Key? key}) : super(key: key);

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        toolbarHeight: 0,
        // backgroundColor: AppColors.white,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsetsDirectional.only(top: 31, start: 20),
            child: Text('Good Morning', style: TextStyle(fontSize: 30, color: AppColors.black)),
          ),
          const SizedBox(height: 15),
          DefaultTabController(
            length: 3,
            child: TabBar(
              // unselectedLabelColor: AppColors.green,
              // labelColor: AppColors.white,
              // unselectedLabelStyle: const TextStyle(color: AppColors.green),
              // indicatorSize: TabBarIndicatorSize.label,
              isScrollable: false,
              // labelPadding: EdgeInsets.zero,
              indicatorPadding: EdgeInsets.zero,
              // indicator: BoxDecoration(
              //   borderRadius: BorderRadius.circular(10),
              //   color: AppColors.green,
              // ),
              padding: const EdgeInsetsDirectional.only(start: 10, end: 160),
              tabs: [
                Tab(
                  height: 21,
                  // text: "All",
                  child: Container(
                    width: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.green.withOpacity(0.1),
                    ),
                    child: const Center(child: Text('All')),
                  ),
                ),
                Tab(
                  height: 21,
                  child: Container(
                    width: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.green.withOpacity(0.1),
                    ),
                    child: const Center(child: Text('Not Done')),
                  ),
                ),
                Tab(
                  height: 21,
                  child: Container(
                    width: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.green.withOpacity(0.1),
                    ),
                    child: const Center(child: Text('Done')),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 5),
          const Padding(
            padding: EdgeInsetsDirectional.only(start: 18, end: 18),
            child: Task(title: 'Build UI Android', dueDate: '12/3/2024'),
          ),
          // Padding(
          //   padding: EdgeInsetsDirectional.only(start: 18, end: 18),
          //   child: Task(title: 'Build UI Android', dueDate: '12/3/2024'),
          // )
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 15),
        child: Container(
          height: 53,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.green,
          ),
          child: const Center(
              child: Text(
            'Create Task',
            style: TextStyle(color: AppColors.white, fontWeight: FontWeight.bold),
          )),
        ),
      ),
    );
  }
}
