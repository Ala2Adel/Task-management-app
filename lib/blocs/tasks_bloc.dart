import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/models/task_model.dart';

part 'tasks_event.dart';

part 'tasks_state.dart';

class TasksBloc extends Bloc<TasksEvent, TasksState> {
  TasksBloc() : super(const TasksLoaded()) {
    on<AddTask>(_onAddTask);
    on<UpdateTask>(_onUpdateTask);
    on<LoadTasks>(_onLoadTasks);
  }

  void _onAddTask(AddTask event, Emitter<TasksState> emit) {
    final state = this.state;
    if (state is TasksLoaded) {
      emit(TasksLoaded(allTasks: List.from(state.allTasks)..add(event.task)));
    }
  }

  void _onUpdateTask(UpdateTask event, Emitter<TasksState> emit) {
    final state = this.state;
    final task = event.task;
    // remove the old list and add the new list and insert it according to its position
    if (state is TasksLoaded) {
      final int index = state.allTasks.indexOf(task);
      List<TaskModel> allTasks = List.from(state.allTasks)..remove(task);
      task.isDone == false
          ? allTasks.insert(
              index,
              task.copyWith(isDone: true),
            )
          : allTasks.insert(index, task.copyWith(isDone: false));
      emit(TasksLoaded(allTasks: allTasks));
    }
  }

  void _onLoadTasks(LoadTasks event, Emitter<TasksState> emit) {
    // try {
    //   emit(TasksLoading());
    //   // final tasks = await _taskRepository.getTask();
    //   final List<TaskModel> tasks = [];
    //   emit(TasksLoaded(allTasks: tasks));
    // } catch (e) {
    //   emit(TasksError(e.toString()));
    // }
  }
}
