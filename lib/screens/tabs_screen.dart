import 'package:flutter/material.dart';
import 'package:flutter_tasks_app/screens/my_drawer.dart';
import 'package:flutter_tasks_app/screens/pending_screen.dart';

import 'add_task_screen.dart';

class TabsScreen extends StatelessWidget {
  const TabsScreen({Key? key}) : super(key: key);

  static const id = 'tabs_screen';
  void _addTask(BuildContext context) {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        // clipBehavior: Clip.antiAliasWithSaveLayer,
        isScrollControlled: true,
        elevation: 5,
        context: context,
        builder: (context) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: AddTaskScreen(),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tabs Screen'),
        actions: [
          IconButton(
            onPressed: () => _addTask(context),
            icon: const Icon(Icons.add),
          )
        ],
      ),
      drawer: const MyDrawer(),
      body: const TasksScreen(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addTask(context),
        tooltip: 'Add Task',
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar:
          BottomNavigationBar(currentIndex: 0, onTap: (index) {}, items: const [
        BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Pending Tasks'),
        BottomNavigationBarItem(
            icon: Icon(Icons.done), label: 'Completed Tasks'),
        BottomNavigationBarItem(
            icon: Icon(Icons.favorite), label: 'Favorite Tasks'),
      ]),
    );
  }
}
