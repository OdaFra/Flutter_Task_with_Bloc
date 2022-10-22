import 'package:flutter/material.dart';

import '../models/taks.dart';

class PopMenuButton extends StatelessWidget {
  const PopMenuButton({
    Key? key,
    required this.cancelOrDeletingCallback,
    required this.task,
    required this.likeorDislikeCallBack,
    required this.editTaskCallBack,
    required this.restoreTaskCallBack,
  }) : super(key: key);

  final Task task;
  final VoidCallback cancelOrDeletingCallback;
  final VoidCallback likeorDislikeCallBack;
  final VoidCallback editTaskCallBack;
  final VoidCallback restoreTaskCallBack;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        itemBuilder: task.isDeleted == false
            ? (context) => [
                  PopupMenuItem(
                    child: TextButton.icon(
                        onPressed: editTaskCallBack,
                        icon: const Icon(Icons.edit),
                        label: const Text('Edit')),
                    onTap: null,
                  ),
                  PopupMenuItem(
                    child: TextButton.icon(
                        onPressed: null,
                        icon: task.isFavorite == false
                            ? const Icon(Icons.bookmark_add_outlined)
                            : const Icon(Icons.bookmark_remove),
                        label: task.isFavorite == false
                            ? const Text('Add Book \nMarks')
                            : const Text('Remove from \nBookmarks')),
                    onTap: likeorDislikeCallBack,
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
                    onTap: restoreTaskCallBack,
                  ),
                  PopupMenuItem(
                      child: TextButton.icon(
                          onPressed: null,
                          icon: const Icon(Icons.delete_forever),
                          label: const Text('Delete forever')),
                      onTap: cancelOrDeletingCallback),
                ]);
  }
}
