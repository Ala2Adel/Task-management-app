part of 'tasks_bloc.dart';

abstract class TasksEvent extends Equatable {
  const TasksEvent();

  @override
  List<Object> get props => [];
}

class AddTask extends TasksEvent {
  final TaskModel task;

  const AddTask({required this.task});

  @override
  List<Object> get props => [];
}

// // update task whether done or not
// class UpdateTask extends TasksEvent {
//   final TaskModel task;
//
//   const UpdateTask({required this.task});
//
//   @override
//   List<Object> get props => [];
// }

class LoadTask extends TasksEvent {
  final List<TaskModel> tasks;

  const LoadTask({this.tasks = const <TaskModel>[]});

  @override
  List<Object> get props => [tasks];
}

class LoadingTasks extends TasksEvent {}
