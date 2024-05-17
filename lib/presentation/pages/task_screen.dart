import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_list_app/presentation/pages/add_task_screen.dart';
import 'package:to_do_list_app/presentation/widget/task_list_item.dart';

import '../../models/task.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  final List<Task> _task = <Task>[];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: _task.isNotEmpty
            ? ListView.builder(
                itemCount: _task.length,
                itemBuilder: (context, index) {
                  return TaskListItem(
                    task: _task[index],
                    removeTask: deleteTaskItem,
                    handleChange: handleChangeTask,
                    handleEdit: updateTaskItem,
                  );
                },
              )
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/app_logo.png',
                      width: 100,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Schedule your tasks",
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Manage your task schedule easily\nand efficiently",
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 12,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
        floatingActionButton: FloatingActionButton(
            child: Icon(
              Icons.add_circle,
              color: Colors.lightBlue[200],
            ),
            onPressed: () async {
              final result = await Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const AddTaskScreen()),
              );

              if (result != null) {
                addTaskToItem(result['name'], result['desc']);
              }
            }),
      ),
    );
  }

  void addTaskToItem(String name, String desc) {
    setState(() {
      _task.add(Task(name: name, desc: desc, isComplete: false));
    });
  }

  void deleteTaskItem(Task task) {
    setState(() {
      _task.removeWhere((element) => element.name == task.name);
    });
  }

  void handleChangeTask(Task task) {
    setState(() {
      task.isComplete = !task.isComplete;
    });
  }

  void updateTaskItem(Task task) {
    setState(() {
      int index = _task.indexWhere((element) => element.name == task.name);
      if (index != -1) {
        _task[index] = task;
      }
    });
  }
}
