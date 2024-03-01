part of 'tasks_bloc.dart';

class TasksState extends Equatable {
  const TasksState();

  @override
  List<Object> get props => [];
}

class TasksLoading extends TasksState {}

class TasksLoaded extends TasksState {
  final List<TaskModel> allTasks;

  const TasksLoaded({this.allTasks = const <TaskModel>[]});

  @override
  List<Object> get props => [allTasks];
}

class TasksError extends TasksState {
  final String? message;

  const TasksError(this.message);
}

class TasksSuccess extends TasksState {
  final String? message;

  const TasksSuccess(this.message);
}
