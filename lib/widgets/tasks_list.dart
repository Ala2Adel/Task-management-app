import 'package:flutter/material.dart';
import 'package:to_do_list/widgets/task.dart';

import '../models/task_model.dart';

class TasksList extends StatelessWidget {
  const TasksList({
    Key? key,
    required this.tasksList,
  }) : super(key: key);

  final List<TaskModel> tasksList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: tasksList.length,
          itemBuilder: (context, index) {
            return Task(task:tasksList[index]);
          }),
    );
  }
}