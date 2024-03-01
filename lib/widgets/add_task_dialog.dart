import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../blocs/tasks_bloc.dart';
import '../models/task_model.dart';
import '../utils/constants.dart';
import 'custom_button.dart';

class AddTaskDialog extends StatefulWidget {
  const AddTaskDialog({Key? key}) : super(key: key);

  @override
  State<AddTaskDialog> createState() => _AddTaskDialogState();
}

class _AddTaskDialogState extends State<AddTaskDialog> {
  late TextEditingController taskTitleController;
  late TextEditingController dueDateController;

  @override
  void initState() {
    super.initState();
    taskTitleController = TextEditingController();
    dueDateController = TextEditingController();
  }

  @override
  void dispose() {
    taskTitleController.dispose();
    dueDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260,
      child: Padding(
        padding: const EdgeInsetsDirectional.only(start: 20, end: 20),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: EdgeInsetsDirectional.only(
                    top: 15, start: MediaQuery.of(context).size.width * 0.8),
                child: InkWell(
                    onTap: () => Navigator.pop(context),
                    child: SvgPicture.asset("assets/close.svg", height: 16, width: 16)),
              ),
              const Text('Create New Task',
                  style: TextStyle(
                      fontSize: 15, color: Constants.blackColor, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              SizedBox(
                height: 33,
                child: TextField(
                    controller: taskTitleController,
                    autofocus: true,
                    decoration: InputDecoration(
                      fillColor: Constants.greyColor.withOpacity(0.8),
                      hintText: 'Task title',
                      hintStyle: TextStyle(
                          fontSize: 12,
                          color: Constants.blackColor.withOpacity(0.5),
                          fontWeight: FontWeight.normal),
                      contentPadding: const EdgeInsetsDirectional.only(start: 20),
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide.none),
                      filled: true,
                    )),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 33,
                child: TextField(
                    controller: dueDateController,
                    keyboardType: TextInputType.datetime,
                    decoration: InputDecoration(
                      fillColor: Constants.greyColor.withOpacity(0.8),
                      hintText: 'Due Date',
                      hintStyle: TextStyle(
                          fontSize: 12,
                          color: Constants.blackColor.withOpacity(0.5),
                          fontWeight: FontWeight.normal),
                      contentPadding: const EdgeInsetsDirectional.only(start: 20),
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide.none),
                      filled: true,
                    )),
              ),
              const SizedBox(height: 20),
              CustomButton(
                buttonTitle: 'Save Task',
                onclick: () {
                  var newTask = TaskModel(
                      id: DateTime.now().toString(),
                      title: taskTitleController.text,
                      dueDate: dueDateController.text,
                      isDone: false);
                  BlocProvider.of<TasksBloc>(context).add(AddTask(task: newTask));
                  Navigator.pop(context);
                },
              ),
            ]),
      ),
    );
  }
}
