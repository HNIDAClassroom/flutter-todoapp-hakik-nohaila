import 'package:flutter/material.dart';
import 'package:tp2/services/firestore.dart';
import 'package:tp2/widgets/new_task.dart';
import 'package:tp2/widgets/tasks_list.dart';
import 'package:tp2/models/task.dart';
import 'package:provider/provider.dart';
import 'color_model.dart'; // Import your ColorModel

class Tasks extends StatefulWidget {
  const Tasks({Key? key}) : super(key: key);

  @override
  State<Tasks> createState() {
    return _TasksState();
  }
}

class _TasksState extends State<Tasks> {
  final FirestoreService firestoreService = FirestoreService();

  void _openAddTaskOverlay() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => NewTask(onAddTask: _addTask),
    );
  }

  void _addTask(Task task) {
    firestoreService.addTask(task); // Add the task to Firestore
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final colorModel = Provider.of<ColorModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter ToDoList'),
        backgroundColor: colorModel.backgroundColor,
        actions: [
          IconButton(
            onPressed: _openAddTaskOverlay,
            icon: const Icon(Icons.add),
          ),
          IconButton(
            onPressed: () => colorModel.toggleBackgroundColor(),
            icon: const Icon(Icons.color_lens), // Add an icon for changing background color
          ),
        ],
      ),
      body: Stack(
        children: [
          TasksList(firestoreService: firestoreService), // Pass the Firestore service
        ],
      ),
    );
  }
}
