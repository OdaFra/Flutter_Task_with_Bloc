import 'package:flutter/material.dart';

import '../models/taks.dart';

class PopMenuButton extends StatelessWidget {
  const PopMenuButton({
    Key? key,
    required this.cancelOrDeletingCallback,
    required this.task,
  }) : super(key: key);

  final Task task;
  final VoidCallback cancelOrDeletingCallback;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        itemBuilder: task.isDeleted == false
            ? (context) => [
                  PopupMenuItem(
                    child: TextButton.icon(
                        onPressed: null,
                        icon: const Icon(Icons.edit),
                        label: const Text('Edit')),
                    onTap: () {},
                  ),
                  PopupMenuItem(
                    child: TextButton.icon(
                        onPressed: null,
                        icon: const Icon(Icons.bookmark),
                        label: const Text('Add Book Marks')),
                    onTap: () {},
                  ),
                  PopupMenuItem(
                      child: TextButton.icon(
                          onPressed: null,
                          icon: const Icon(Icons.delete),
                          label: const Text('Delete')),
                      onTap: cancelOrDeletingCallback
                      //_removeOrDeleteTask(context, task),
                      ),
                ]
            : (context) => [
                  PopupMenuItem(
                      child: TextButton.icon(
                          onPressed: null,
                          icon: const Icon(Icons.restore),
                          label: const Text('Restore')),
                      onTap: () {}),
                  PopupMenuItem(
                      child: TextButton.icon(
                          onPressed: null,
                          icon: const Icon(Icons.delete_forever),
                          label: const Text('Delete forever')),
                      onTap: cancelOrDeletingCallback),
                ]);
  }
}
