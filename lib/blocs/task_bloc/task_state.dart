// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'task_bloc.dart';

class TaskState extends Equatable {
  final List<Task> pendingTasks;
  final List<Task> completedTasks;
  final List<Task> favoriteTasks;
  final List<Task> removedTasks;
  const TaskState({
    this.completedTasks = const <Task>[],
    this.favoriteTasks = const <Task>[],
    this.pendingTasks = const <Task>[],
    this.removedTasks = const <Task>[],
  });

  @override
  List<Object> get props => [
        pendingTasks,
        removedTasks,
        completedTasks,
        favoriteTasks,
      ];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'pendingTasks': pendingTasks.map((x) => x.toMap()).toList(),
      'completedTasks': completedTasks.map((x) => x.toMap()).toList(),
      'favoriteTasks': favoriteTasks.map((x) => x.toMap()).toList(),
      'removedTasks': removedTasks.map((x) => x.toMap()).toList(),
    };
  }

  factory TaskState.fromMap(Map<String, dynamic> map) {
    return TaskState(
        pendingTasks:
            List<Task>.from(map['pendingTasks']?.map((x) => Task.fromMap(x))),
        completedTasks:
            List<Task>.from(map['completedTasks']?.map((x) => Task.fromMap(x))),
        favoriteTasks:
            List<Task>.from(map['favoriteTasks']?.map((x) => Task.fromMap(x))),
        removedTasks:
            List<Task>.from(map['removedTasks']?.map((x) => Task.fromMap(x)))
        // List<Task>.from(
        //   (map['allTasks'] as List<int>).map<Task>(
        //     (x) => Task.fromMap(x as Map<String, dynamic>),
        //   ),
        // ),
        );
  }
}
