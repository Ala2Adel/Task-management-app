import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../app_colors.dart';
import 'custom_button.dart';

class TaskDialog extends StatefulWidget {
  const TaskDialog({Key? key}) : super(key: key);

  @override
  State<TaskDialog> createState() => _TaskDialogState();
}

class _TaskDialogState extends State<TaskDialog> {
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
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsetsDirectional.only(
                    top: 15, start: MediaQuery.of(context).size.width * 0.8),
                child: InkWell(
                    onTap: () => Navigator.pop(context),
                    child: SvgPicture.asset("assets/close.svg", height: 16, width: 16)),
              ),
              const Text('Create New Task',
                  style:
                      TextStyle(fontSize: 15, color: AppColors.black, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              SizedBox(
                height: 33,
                child: TextField(
                    controller: taskTitleController,
                    decoration: InputDecoration(
                      fillColor: AppColors.grey.withOpacity(0.8),
                      hintText: 'Task title',
                      hintStyle: TextStyle(
                          fontSize: 12,
                          color: AppColors.black.withOpacity(0.5),
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
                    decoration: InputDecoration(
                      fillColor: AppColors.grey.withOpacity(0.8),
                      hintText: 'Due Date',
                      hintStyle: TextStyle(
                          fontSize: 12,
                          color: AppColors.black.withOpacity(0.5),
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
                  showModalBottomSheet(
                      context: context,
                      constraints:
                          BoxConstraints(minWidth: MediaQuery.of(context).size.width * 0.95),
                      shape: const RoundedRectangleBorder(
                        side: BorderSide(color: AppColors.grey, width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      builder: (BuildContext context) => SizedBox());
                },
              ),
            ]),
      ),
    );
  }
}
