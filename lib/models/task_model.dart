import 'package:equatable/equatable.dart';

class TaskModel extends Equatable {
  final String title;
  final String dueDate;
  bool? isDone;
  bool? isDeleted;

  TaskModel({required this.title, required this.dueDate, this.isDone, this.isDeleted}) {
    isDone = isDone ?? false;
    isDeleted = isDeleted ?? false;
  }

  TaskModel copyWith({
    String? title,
    String? dueDate,
    bool? isDone,
    bool? isDeleted,
  }) {
    return TaskModel(
      title: title ?? this.title,
      dueDate: dueDate ?? this.dueDate,
      isDone: isDone ?? this.isDone,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'dueDate': dueDate,
      'isDone': isDone,
      'isDeleted': isDeleted,
    };
  }

  factory TaskModel.fromMap(Map<String, dynamic> json) => TaskModel(
      title: json['title'] ?? '',
      dueDate: json['dueDate'] ?? '',
      isDone: json['isDone'],
      isDeleted: json['isDeleted']);

  @override
  List<Object?> get props => [title, dueDate, isDone, isDeleted];
}
