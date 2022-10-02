import 'package:flutter/material.dart';
import 'package:flutter_tasks_app/blocs/bloc_exports.dart';
import 'package:flutter_tasks_app/screens/recycle_bin.dart';
import 'package:flutter_tasks_app/screens/tasks_screen.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

bool switchvalue = false;

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
              color: Colors.grey,
              child: Text(
                'Task Drawer ',
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            BlocBuilder<TaskBloc, TaskState>(
              builder: (context, state) {
                return GestureDetector(
                  onTap: () => Navigator.of(context)
                      .pushReplacementNamed(TasksScreen.id),
                  child: ListTile(
                    leading: const Icon(Icons.folder_special_outlined),
                    title: const Text('My Tasks'),
                    trailing: Text('${state.allTasks.length}'),
                  ),
                );
              },
            ),
            const Divider(),
            BlocBuilder<TaskBloc, TaskState>(
              builder: (context, state) {
                return GestureDetector(
                  onTap: () =>
                      Navigator.of(context).pushReplacementNamed(RecycleBin.id),
                  child: ListTile(
                    leading: const Icon(Icons.delete),
                    title: const Text('Bin'),
                    trailing: Text('${state.removedTasks.length}'),
                  ),
                );
              },
            ),
            Switch(
                value: switchvalue,
                onChanged: (value) {
                  setState(() {
                    switchvalue = value;
                  });
                })
          ],
        ),
      ),
    );
  }
}
