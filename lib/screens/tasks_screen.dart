import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/tasks_bloc.dart';
import '../utils/constants.dart';
import '../widgets/add_task_dialog.dart';
import '../widgets/custom_button.dart';
import '../widgets/task.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({Key? key}) : super(key: key);

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> with TickerProviderStateMixin {
  // TaskModel task1 = TaskModel(title: 'TITLE 1', dueDate: '23/12/2023');
  // TaskModel task2 = TaskModel(title: 'TITLE 2', dueDate: '1/2/2024');
  //
  // late List<Task> tasksList = [
  //   Task(task: task1),
  //   Task(task: task2),
  // ];

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      initialIndex: 0,
      length: 3,
      vsync: this,
    );
    BlocProvider.of<TasksBloc>(context).add(LoadTasks());
  }

  @override
  Widget build(BuildContext context) {
    final TasksBloc _taskBloc = BlocProvider.of<TasksBloc>(context);
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        if (state is TasksLoading) {
          return const Center(
              child: CircularProgressIndicator(
            color: Constants.primaryColor,
            strokeWidth: 5,
          ));
        } else if (state is TasksLoaded) {
          final tasksList = state.allTasks;
          return Scaffold(
              backgroundColor: Constants.whiteColor,
              appBar: AppBar(
                toolbarHeight: 0,
                backgroundColor: Constants.primaryColor,
              ),
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsetsDirectional.only(top: 31, start: 4),
                        child: Text('Good Morning',
                            style: TextStyle(fontSize: 30, color: Constants.blackColor)),
                      ),
                      const SizedBox(height: 15),
                      DefaultTabController(
                        length: 3,
                        child: TabBar(
                          controller: _tabController,
                          isScrollable: false,
                          indicatorWeight: 0.1,
                          padding: EdgeInsetsDirectional.only(
                              start: 4, end: MediaQuery.of(context).size.width * 0.3),
                          tabs: [
                            Tab(
                              height: 21,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Constants.primaryColor.withOpacity(0.1),
                                ),
                                child: const Center(child: Text('All')),
                              ),
                            ),
                            Tab(
                              height: 21,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Constants.primaryColor.withOpacity(0.1),
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
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Constants.primaryColor.withOpacity(0.1),
                                ),
                                child: const Center(child: Text('Done')),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.7,
                        child: TabBarView(controller: _tabController, children: [
                          tasksList.isNotEmpty
                              ? ListView.builder(
                                  itemCount: tasksList.length,
                                  itemBuilder: (context, index) {
                                    return Task(task: tasksList[index]);
                                  })
                              : const Center(
                                  child: Text('No tasks added yet',
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Constants.blackColor,
                                          fontWeight: FontWeight.normal))),
                          ListView.builder(
                              itemCount: tasksList.length,
                              itemBuilder: (context, index) {
                                return tasksList[index].isDone == false
                                    ? Task(task: tasksList[index])
                                    : const SizedBox();
                              }),
                          ListView.builder(
                              itemCount: tasksList.length,
                              itemBuilder: (context, index) {
                                return tasksList[index].isDone == true
                                    ? Task(task: tasksList[index])
                                    : const SizedBox();
                              }),
                        ]),
                      ),
                    ],
                  ),
                ),
              ),
              bottomNavigationBar: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 15),
                child: CustomButton(
                  buttonTitle: 'Create Task',
                  onclick: () {
                    showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        constraints:
                            BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.94),
                        shape: const RoundedRectangleBorder(
                          side: BorderSide(color: Constants.greyColor, width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        builder: (BuildContext context) => Padding(
                              padding:
                                  EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                              child: const AddTaskDialog(),
                            ));
                  },
                ),
              ));
        } else if (state is TasksSuccess) {
          _taskBloc.add(LoadTasks());
          return Container();
        } else if (state is TasksError) {
          return Center(child: Text(state.message!));
        } else {
          return Container();
        }
      },
    );
  }
}
