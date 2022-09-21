// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'task_bloc.dart';

class TaskState extends Equatable {
  final List<Task> allTasks;
  const TaskState({
    this.allTasks = const <Task>[],
  });

  @override
  List<Object> get props => [
        allTasks,
      ];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'allTasks': allTasks.map((x) => x.toMap()).toList(),
    };
  }

  factory TaskState.fromMap(Map<String, dynamic> map) {
    return TaskState(
        allTasks: List<Task>.from(map['allTasks']?.map((x) => Task.fromMap(x)))
        // List<Task>.from(
        //   (map['allTasks'] as List<int>).map<Task>(
        //     (x) => Task.fromMap(x as Map<String, dynamic>),
        //   ),
        // ),
        );
  }
}
