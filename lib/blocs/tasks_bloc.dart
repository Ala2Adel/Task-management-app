import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/models/task_model.dart';

import '../service/firestore_service.dart';

part 'tasks_event.dart';

part 'tasks_state.dart';

class TasksBloc extends Bloc<TasksEvent, TasksState> {
  final FirestoreService _firestoreService;

  TasksBloc(this._firestoreService) : super(const TasksLoaded()) {
    on<AddTask>(_onAddTask);
    on<UpdateTask>(_onUpdateTask);
    on<LoadTasks>(_onLoadTasks);
    // on<DeleteTask>(_onDeleteTask);
  }

  _onLoadTasks(LoadTasks event, Emitter<TasksState> emit) async {
    try {
      emit(TasksLoading());
      final tasks = await _firestoreService.getTasks().first;
      emit(TasksLoaded(allTasks: tasks));
    } catch (e) {
      emit(TasksError(e.toString()));
    }
  }

  Future<void> _onAddTask(AddTask event, Emitter<TasksState> emit) async {
    // final state = this.state;
    try {
      emit(TasksLoading());
      await _firestoreService.addTask(event.task);
      debugPrint("---- in add task");
      emit(const TasksSuccess('Success to add task'));
      // if (state is TasksLoaded) {
      //   emit(TasksLoaded(allTasks: List.from(state.allTasks)..add(event.task)));
      // }
    } catch (e) {
      emit(TasksError('Failed to add task $e'));
    }
  }

  // void _onUpdateTask(UpdateTask event, Emitter<TasksState> emit) {
  //   final state = this.state;
  //   final task = event.task;
  //   // remove the old list and add the new list and insert it according to its position
  //   if (state is TasksLoaded) {
  //     final int index = state.allTasks.indexOf(task);
  //     List<TaskModel> allTasks = List.from(state.allTasks)..remove(task);
  //     task.isDone == false
  //         ? allTasks.insert(
  //             index,
  //             task.copyWith(isDone: true),
  //           )
  //         : allTasks.insert(index, task.copyWith(isDone: false));
  //     emit(TasksLoaded(allTasks: allTasks));
  //   }
  // }

  void _onUpdateTask(UpdateTask event, Emitter<TasksState> emit) async {
    try {
      emit(TasksLoading());
      await _firestoreService.updateTask(event.task);
      debugPrint("---- in update task");
      emit(const TasksSuccess('Success to update task'));
    } catch (e) {
      emit(TasksError('Failed to update todo $e'));
    }
  }

// void _onDeleteTask(DeleteTask event, Emitter<TasksState> emit) {
//   final state = this.state;
//   final task = event.task;
//
//   if (state is TasksLoaded) {
//     List<TaskModel> allTasks = List.from(state.allTasks)..remove(task);
//     emit(TasksLoaded(allTasks: allTasks));
//   }
// }
}
