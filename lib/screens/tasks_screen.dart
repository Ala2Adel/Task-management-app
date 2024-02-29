import 'package:flutter/material.dart';
import 'package:to_do_list/models/task_model.dart';

import '../app_colors.dart';
import '../widgets/custom_button.dart';
import '../widgets/task.dart';
import '../widgets/task_dialog.dart';

class TasksScreen extends StatefulWidget {
  TasksScreen({Key? key}) : super(key: key);

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  TaskModel task1 = TaskModel(title: 'TITLE 1', dueDate: '23/12/2023');
  TaskModel task2 = TaskModel(title: 'TITLE 2', dueDate: '1/2/2024');

  late List<Task> tasksList = [
    Task(task: task1),
    Task(task: task2),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          toolbarHeight: 0,
          // backgroundColor: AppColors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsetsDirectional.only(top: 31, start: 4),
                child: Text('Good Morning', style: TextStyle(fontSize: 30, color: AppColors.black)),
              ),
              const SizedBox(height: 15),
              DefaultTabController(
                length: 3,
                child: TabBar(
                  isScrollable: false,
                  indicatorWeight: 0.1,
                  padding: EdgeInsetsDirectional.only(
                      start: 4, end: MediaQuery.of(context).size.width * 0.3),
                  tabs: [
                    Tab(
                      height: 21,
                      child: Container(
                        // width: 60,
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
                        // width: 75,
                        // padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.green.withOpacity(0.1),
                        ),
                        child: const Center(
                            child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          child: Text('Not Done'),
                        )),
                      ),
                    ),
                    Tab(
                      height: 21,
                      child: Container(
                        // width: 60,
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
              Expanded(
                child: ListView.builder(
                    itemCount: tasksList.length,
                    itemBuilder: (context, index) {
                      return tasksList[index];
                    }),
              )
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 15),
          child: CustomButton(
            buttonTitle: 'Create Task',
            onclick: () {
              showModalBottomSheet(
                  context: context,
                  constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.94),
                  shape: const RoundedRectangleBorder(
                    side: BorderSide(color: AppColors.grey, width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  builder: (BuildContext context) => TaskDialog());
            },
          ),
        ));
  }
}
