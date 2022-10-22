import 'package:flutter/material.dart';
import 'package:flutter_tasks_app/screens/my_drawer.dart';

import '../blocs/bloc_exports.dart';
import '../widgets/task_list.dart';

class RecycleBin extends StatelessWidget {
  const RecycleBin({Key? key}) : super(key: key);

  static const id = 'recycle_bin_screen';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        return Scaffold(
          extendBody: true,
          //resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: const Text('Recycle Tasks App'),
            actions: [
              PopupMenuButton(
                  itemBuilder: (context) => [
                        PopupMenuItem(
                          child: TextButton.icon(
                            onPressed: null,
                            icon: const Icon(Icons.delete_forever),
                            label: const Text('Delete all Task'),
                          ),
                          onTap: () =>
                              context.read<TaskBloc>().add(DeleteAllTask()),
                        )
                      ])
            ],
          ),
          drawer: const MyDrawer(),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Chip(
                  label: Text(
                    '${state.removedTasks.length} Tasks',
                  ),
                ),
              ),
              TaskList(taskList: state.removedTasks)
            ],
          ),
        );
      },
    );
  }
}
