import 'package:flutter/material.dart';
import 'package:flutter_tasks_app/services/guid_gen.dart';

import '../blocs/bloc_exports.dart';
import '../models/taks.dart';

// ignore: must_be_immutable
class AddTaskScreen extends StatelessWidget {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  AddTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      child: Column(
        children: [
          const Text('Add task', style: TextStyle(fontSize: 24)),
          const SizedBox(height: 10),
          TextField(
            autofocus: true,
            controller: titleController,
            decoration: const InputDecoration(
                label: Text('Title'), border: OutlineInputBorder()),
          ),
          const SizedBox(height: 10),
          TextField(
            autofocus: true,
            controller: descriptionController,
            maxLines: 5,
            minLines: 2,
            decoration: const InputDecoration(
                label: Text('Description'), border: OutlineInputBorder()),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel')),
              ElevatedButton(
                  onPressed: () {
                    var task = Task(
                        description: descriptionController.text,
                        title: titleController.text,
                        id: GUIDGen.generate(),
                        date: DateTime.now().toString());
                    context.read<TaskBloc>().add(AddTask(task: task));
                    Navigator.pop(context);
                  },
                  child: const Text('Add Task'))
            ],
          ),
        ],
      ),
    );
  }
}
