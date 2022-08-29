part of 'task_bloc.dart';

abstract class TaskEvent extends Equatable {
  const TaskEvent();

  @override
  List<Object> get props => [];
}

class AddTask extends TaskEvent {
  final Task task;
  const AddTask({required this.task});

  @override
  List<Object> get props => [
        task,
      ];
}

class UpdateTask extends TaskEvent {
  final Task task;
  const UpdateTask({required this.task});

  @override
  List<Object> get props => [
        task,
      ];
}
