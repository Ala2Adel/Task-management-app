import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../app_colors.dart';
import '../models/task_model.dart';

class Task extends StatelessWidget {
  final TaskModel task;

  const Task({required this.task, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: AppColors.grey,
      color: AppColors.lightGrey,
      elevation: 5,
      shape: const RoundedRectangleBorder(
        side: BorderSide(color: AppColors.grey, width: 1),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: SizedBox(
        height: 79,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(task.title,
                        style: const TextStyle(
                            fontSize: 15, color: AppColors.black, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 5),
                    Text("Due Date: ${task.dueDate}",
                        style: const TextStyle(
                            fontSize: 12, color: AppColors.black, fontWeight: FontWeight.normal))
                  ]),
              Container(
                width: 25,
                height: 25,
                padding: const EdgeInsetsDirectional.only(start: 6.17, bottom: 6.17),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(25)),
                  color: AppColors.green.withOpacity(0.2),
                ),
                child: SvgPicture.asset("assets/check.svg", height: 12, width: 17),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
