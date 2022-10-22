import 'package:flutter/material.dart';

import '../blocs/bloc_exports.dart';
import '../models/taks.dart';

// ignore: must_be_immutable
class EditTaskScreen extends StatelessWidget {
  final Task oldTask;

  const EditTaskScreen({Key? key, required this.oldTask}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController(
      text: oldTask.title,
    );
    TextEditingController descriptionController =
        TextEditingController(text: oldTask.description);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      child: Column(
        children: [
          const Text('Edit task', style: TextStyle(fontSize: 24)),
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
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Cancel')),
              ElevatedButton(
                  onPressed: () {
                    var editeTask = Task(
                        description: descriptionController.text,
                        title: titleController.text,
                        id: oldTask.id,
                        isDone: false,
                        date: DateTime.now().toString());
                    context
                        .read<TaskBloc>()
                        .add(EditTask(oldTask: oldTask, newTask: editeTask));
                    Navigator.pop(context);
                  },
                  child: const Text('Save Task'))
            ],
          ),
        ],
      ),
    );
  }
}
