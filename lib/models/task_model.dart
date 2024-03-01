import 'package:equatable/equatable.dart';

class TaskModel extends Equatable {
  String? id;
  final String title;
  final String dueDate;
  bool? isDone;
  bool? isDeleted;

  TaskModel({required this.title, required this.dueDate, this.isDone, this.isDeleted, this.id}) {
    isDone = isDone ?? false;
    isDeleted = isDeleted ?? false;
  }

  TaskModel copyWith({
    String? id,
    String? title,
    String? dueDate,
    bool? isDone,
    bool? isDeleted,
  }) {
    return TaskModel(
      id: id ?? this.id,
      title: title ?? this.title,
      dueDate: dueDate ?? this.dueDate,
      isDone: isDone ?? this.isDone,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'due_date': dueDate,
      'is_done': isDone,
      'isDeleted': isDeleted,
    };
  }

  factory TaskModel.fromMap(Map<String, dynamic> json) =>
      TaskModel(
          title: json['title'] ?? '',
          dueDate: json['due_date'] ?? '',
          isDone: json['is_done'],
          isDeleted: json['isDeleted']);

  @override
  List<Object?> get props => [title, dueDate, isDone, isDeleted];
}
