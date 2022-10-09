import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tasks_app/widgets/poppu_menu.dart';
import 'package:intl/intl.dart';

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
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                const Icon(Icons.star_outline),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(task.title,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 18,
                              decoration: task.isDone!
                                  ? TextDecoration.lineThrough
                                  : null)),
                      Text(DateFormat('dd-MM-yyyy hh:mm a')
                          //.add_yMEd()
                          .format(DateTime.parse(task.date)))
                    ],
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Checkbox(
                  value: task.isDone,
                  onChanged: task.isDeleted == false
                      ? (value) {
                          context.read<TaskBloc>().add(UpdateTask(task: task));
                        }
                      : null),
              PopMenuButton(
                cancelOrDeletingCallback: () =>
                    _removeOrDeleteTask(context, task),
                task: task,
              )
            ],
          ),
        ],
      ),
    );
  }
}

// ListTile(
//       title: Text(
//         task.title,
//         overflow: TextOverflow.ellipsis,
//         style: TextStyle(
//             decoration: task.isDone! ? TextDecoration.lineThrough : null),
//       ),
//       trailing: Checkbox(
//           value: task.isDone,
//           onChanged: task.isDeleted == false
//               ? (value) {
//                   context.read<TaskBloc>().add(UpdateTask(task: task));
//                 }
//               : null),
//       onLongPress: () => _removeOrDeleteTask(context, task),
//     );