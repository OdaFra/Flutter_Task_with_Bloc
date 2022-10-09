import 'package:flutter/material.dart';
import 'package:flutter_tasks_app/blocs/bloc_exports.dart';

import '../models/taks.dart';
import '../widgets/task_list.dart';

class PendingTaskScreen extends StatelessWidget {
  const PendingTaskScreen({Key? key}) : super(key: key);
  static const id = 'pending_screen';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(builder: (context, state) {
      List<Task> taskList = state.pendingTasks;
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Chip(
              label: Text(
                '${taskList.length} Pending | ${state.completedTasks.length} Completed',
              ),
            ),
          ),
          TaskList(taskList: taskList)
        ],
      );
    });
  }
}
