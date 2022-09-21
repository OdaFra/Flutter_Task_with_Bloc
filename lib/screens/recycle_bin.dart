import 'package:flutter/material.dart';
import 'package:flutter_tasks_app/screens/my_drawer.dart';

import '../widgets/task_list.dart';

class RecycleBin extends StatelessWidget {
  const RecycleBin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      //resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Recycle Tasks App'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          )
        ],
      ),
      drawer: const MyDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Center(
            child: Chip(
              label: Text(
                'Tasks',
              ),
            ),
          ),
          TaskList(taskList: [])
        ],
      ),
    );
  }
}
