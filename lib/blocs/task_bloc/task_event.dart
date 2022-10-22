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
  List<Object> get props => [task];
}

class UpdateTask extends TaskEvent {
  final Task task;
  const UpdateTask({required this.task});

  @override
  List<Object> get props => [task];
}

class DeleteTask extends TaskEvent {
  final Task task;
  const DeleteTask({required this.task});

  @override
  List<Object> get props => [task];
}

class RemoveTask extends TaskEvent {
  final Task task;
  const RemoveTask({required this.task});

  @override
  List<Object> get props => [task];
}

class MarkFavoriteOrUnFavoriteEvent extends TaskEvent {
  final Task task;

  const MarkFavoriteOrUnFavoriteEvent({required this.task});

  @override
  List<Object> get props => [task];
}

class EditTask extends TaskEvent {
  final Task oldTask;
  final Task newTask;

  const EditTask({
    required this.oldTask,
    required this.newTask,
  });
  @override
  List<Object> get props => [
        oldTask,
        newTask,
      ];
}

class RestoreTask extends TaskEvent {
  final Task task;

  const RestoreTask({required this.task});
  @override
  List<Object> get props => [task];
}

class DeleteAllTask extends TaskEvent {}
