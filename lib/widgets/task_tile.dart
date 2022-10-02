import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/task_bloc/task_bloc.dart';
import '../models/taks.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    Key? key,
    required this.task,
  }) : super(key: key);

  final Task task;

  void _removeOrDeleteTask(BuildContext ctx, Task task) {
    task.isDeleted!
        ? ctx.read<TaskBloc>().add(DeleteTask(task: task))
        : ctx.read<TaskBloc>().add(RemoveTask(task: task));
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        task.title,
        style: TextStyle(
            decoration: task.isDone! ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
          value: task.isDone,
          onChanged: task.isDeleted == false
              ? (value) {
                  context.read<TaskBloc>().add(UpdateTask(task: task));
                }
              : null),
      onLongPress: () => _removeOrDeleteTask(context, task),
    );
  }
}
