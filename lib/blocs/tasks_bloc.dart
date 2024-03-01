import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:to_do_list/models/task_model.dart';

part 'tasks_event.dart';

part 'tasks_state.dart';

class TasksBloc extends Bloc<TasksEvent, TasksState> {
  TasksBloc() : super(const TasksLoaded()) {
    on<AddTask>(_onAddTask);
    // on<UpdateTask>(_onUpdateTask);
    on<LoadTask>(_onLoadTask);
  }

  void _onAddTask(AddTask event, Emitter<TasksState> emit) {
    final state = this.state;
    if (state is TasksLoaded) {
      emit(TasksLoaded(allTasks: List.from(state.allTasks)..add(event.task)));
    }
  }

  // void _onUpdateTask(UpdateTask event, Emitter<TasksState> emit) {}

  void _onLoadTask(LoadTask event, Emitter<TasksState> emit) {
    emit(TasksLoading());
    try {
      // final tasks = await _taskRepository.getTask();
      final List<TaskModel> tasks = [];
      emit(TasksLoaded(allTasks: tasks));
    } catch (e) {
      emit(TasksError(e.toString()));
    }
  }
}
