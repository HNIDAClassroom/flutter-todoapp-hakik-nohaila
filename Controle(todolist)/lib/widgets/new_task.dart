import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tp2/models/task.dart';
import 'package:tp2/color_model.dart';


class NewTask extends StatefulWidget {
  const NewTask({Key? key, required this.onAddTask}) : super(key: key);

  final void Function(Task task) onAddTask;

  @override
  State<NewTask> createState() {
    return _NewTaskState();
  }
}

class _NewTaskState extends State<NewTask> {
  Category _selectedCategory = Category.personal;
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final colorModel = Provider.of<ColorModel>(context);

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          DropdownButton<Category>(
            value: _selectedCategory,
            items: Category.values
                .map((category) => DropdownMenuItem<Category>(
              value: category,
              child: Text(
                category.name.toUpperCase(),
              ),
            ))
                .toList(),
            onChanged: (value) {
              if (value == null) {
                return;
              }
              setState(() {
                _selectedCategory = value;
              });
            },
          ),
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: InputDecoration(
              labelText: 'Task Title',
            ),
          ),
          TextField(
            controller: _descriptionController,
            maxLength: 50,
            decoration: InputDecoration(
              labelText: 'Task Description',
            ),
          ),
          ElevatedButton(
            onPressed: () {
              widget.onAddTask(
                Task(
                  title: _titleController.text,
                  description: _descriptionController.text,
                  date: _selectedDate,
                  category: _selectedCategory,
                ),
              );
            },
            child: const Text('Save Task'),
            style: ElevatedButton.styleFrom(
              primary: colorModel.backgroundColor,
            ),
          ),
          ElevatedButton(
            onPressed: () => _selectDate(context),
            child: const Text('Select Date'),
            style: ElevatedButton.styleFrom(
              primary: colorModel.backgroundColor,
            ),
          ),
          Text('Selected Date: ${_selectedDate.toLocal()}'.split(' ')[0]),
        ],
      ),
    );
  }

  void _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }
}
