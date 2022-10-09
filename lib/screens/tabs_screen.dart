import 'package:flutter/material.dart';
import 'package:flutter_tasks_app/screens/completed_task.dart';
import 'package:flutter_tasks_app/screens/favorite_task.dart';
import 'package:flutter_tasks_app/screens/my_drawer.dart';
import 'package:flutter_tasks_app/screens/pending_screen.dart';

import 'add_task_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  static const id = 'tabs_screen';

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, dynamic>> _pageDetails = [
    {'pageName': const PendingTaskScreen(), 'title': 'Pending Tasks'},
    {'pageName': const CompletedTaskScreen(), 'title': 'Completed Tasks'},
    {'pageName': const FavoriteTaskScreen(), 'title': 'Favorite Tasks'}
  ];

  var _selectPageIndex = 0;

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
        title: Text(_pageDetails[_selectPageIndex]['title']),
        actions: [
          IconButton(
            onPressed: () => _addTask(context),
            icon: const Icon(Icons.add),
          )
        ],
      ),
      drawer: const MyDrawer(),
      body: _pageDetails[_selectPageIndex]['pageName'],
      floatingActionButton: _selectPageIndex == 0
          ? FloatingActionButton(
              onPressed: () => _addTask(context),
              tooltip: 'Add Task',
              child: const Icon(Icons.add),
            )
          : null,
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectPageIndex,
          onTap: (index) {
            setState(() {
              _selectPageIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.incomplete_circle_sharp),
                label: 'Pending Tasks'),
            BottomNavigationBarItem(
                icon: Icon(Icons.done), label: 'Completed Tasks'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: 'Favorite Tasks'),
          ]),
    );
  }
}
