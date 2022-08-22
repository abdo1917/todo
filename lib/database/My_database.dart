import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo/database/task.dart';

class MyDatabase {
  static CollectionReference<Task> getTasksCollection() {
    return FirebaseFirestore.instance
        .collection(Task.collectionName)
        .withConverter<Task>(fromFirestore: (snapshot, options) {
      return Task.fromFireStore(snapshot.data() ?? {});
    }, toFirestore: (task, options) {
      return task.toFireStore();
    });
  }

  void insertTask(Task task) {
    var TaskCollection =getTasksCollection();
    var taskDoc=TaskCollection.doc();
    task.id =taskDoc.id;
    taskDoc.set(task);
  }

}
