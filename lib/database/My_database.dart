import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo/database/task.dart';

import '../date_Utils.dart';

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

  // void insertTask(Task task) {
  //   var TaskCollection =getTasksCollection();
  //   var taskDoc=TaskCollection.doc();
  //   task.id =taskDoc.id;
  //   taskDoc.set(task);
  // }
  static Future<void> addTask(Task task) {
    var taskDoc = getTasksCollection()
        .doc();
    task.dateTime = dateOnly(task.dateTime!);
    task.id = taskDoc.id;
    return taskDoc.set(task);
  }
  static Future<QuerySnapshot<Task>> getTasks(
      DateTime dateTime)async{
    var collection = getTasksCollection()
        .where('dateTime',isEqualTo: dateOnly(dateTime).millisecondsSinceEpoch);
    return collection.get();
  }
  static  Stream<QuerySnapshot<Task>>listenForTaskUpdates(){
    var collection = getTasksCollection();
    return collection.snapshots();
  }
  static Future<void>deleteTask(Task task){
    var tasksCollection = getTasksCollection();
    var taskRef = tasksCollection.doc(task.id);
    return taskRef.delete();
  }

}
