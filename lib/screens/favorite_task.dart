import 'package:flutter/material.dart';
import 'package:flutter_tasks_app/blocs/bloc_exports.dart';

import '../models/taks.dart';
import '../widgets/task_list.dart';

class FavoriteTaskScreen extends StatelessWidget {
  const FavoriteTaskScreen({Key? key}) : super(key: key);
  static const id = 'favorite_screen';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(builder: (context, state) {
      List<Task> taskList = state.favoriteTasks;
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Chip(
              label: Text(
                '${taskList.length} Tasks',
              ),
            ),
          ),
          TaskList(taskList: taskList)
        ],
      );
    });
  }
}
