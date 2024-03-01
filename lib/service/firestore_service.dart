import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:to_do_list/models/task_model.dart';

class FirestoreService {
  final CollectionReference _tasksCollection = FirebaseFirestore.instance.collection('tasks');

  // get tasks from firestore
  Stream<List<TaskModel>> getTasks() {
    return _tasksCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data();
        return TaskModel(
          id: doc.id,
          title: data['title'],
          dueDate: data['due_date'],
          isDone: data['is_done'],
        );
      }).toList();
    });
  }

  Future<void> addTask(TaskModel todo) {
    return _tasksCollection
        .add({'title': todo.title, 'due_date': todo.dueDate, 'is_done': todo.isDone});
  }

  Future<void> updateTask(TaskModel task) {
    return _tasksCollection
        .doc(task.id)
        // .set(
        // {'title': task.title, 'due_date': task.dueDate, 'is_done': task.isDone},
        // SetOptions(merge: true));

        .update({'title': task.title, 'due_date': task.dueDate, 'is_done': task.isDone})
        .then((_) => print('Success'))
        .catchError((error) => print('Failed: $error'));
  }
}
