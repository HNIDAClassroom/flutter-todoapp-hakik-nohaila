import 'package:flutter/material.dart';
import 'package:tp2/models/task.dart';

class TaskItem extends StatelessWidget {
  final Task task;
  final VoidCallback onDelete;
  final VoidCallback oncomplete;
  final VoidCallback Notcomplete;


  TaskItem({required this.task, required this.onDelete, required this.oncomplete, required this.Notcomplete});
  String getCategoryName(Category category) {
    print('Category value: ${task.iscompleted}');

    switch (category) {
      case Category.personal:
        return 'Personal';
      case Category.work:
        return 'Work';
      case Category.shopping:
        return 'Shopping';
      default:
        return 'Others';
    }
  }
  @override
  Widget build(BuildContext context) {
    return Card(

      child: ListTile(
        title: Text(task.title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            Text(task.description),
            Text('Date: ${task.date.toString()}'),
            Text('Category: ${getCategoryName(task.category)}'),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            IconButton(
              icon: Icon(
                task.iscompleted ? Icons.clear : Icons.check,
              ),
                onPressed: () {
                  task.iscompleted ? Notcomplete() : oncomplete();
                },

            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: onDelete,
            ),
          ],
        ),
      ),
    );
  }
}
