import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_list_app/presentation/pages/update_task_screen.dart';

import '../../models/task.dart';

class TaskListItem extends StatefulWidget {
  final Task task;
  final void Function(Task task) removeTask;
  final void Function(Task task) handleChange;
  final void Function(Task task) handleEdit;

  const TaskListItem(
      {super.key,
      required this.task,
      required this.removeTask,
      required this.handleChange,
      required this.handleEdit});

  @override
  State<TaskListItem> createState() => _TaskListItemState();
}

class _TaskListItemState extends State<TaskListItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      child: Row(
        children: [
          Checkbox(
            value: widget.task.isComplete,
            onChanged: (value) {
              setState(() {
                widget.handleChange(widget.task);
              });
            },
            activeColor: Colors.lightBlue[200],
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${widget.task.name}",
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
                Text(
                  "${widget.task.desc}",
                  style: GoogleFonts.poppins(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                )
              ],
            ),
          ),
          PopupMenuButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            color: Colors.white,
            elevation: 1,
            onSelected: (value) async {
              switch (value) {
                case 0:
                  {
                    final result = await Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) =>
                                UpdateTaskScreen(task: widget.task)));
                    if (result != null) {
                      setState(() {
                        widget.task.name = result['name'];
                        widget.task.desc = result['desc'];
                        widget.handleEdit(widget.task);
                      });
                    }
                  }
                  break;
                case 1:
                  {
                    widget.removeTask(widget.task);
                  }
                  break;
              }
            },
            itemBuilder: (BuildContext context) => [
              PopupMenuItem(
                value: 0,
                child: Row(
                  children: [
                    Image.asset(
                      'assets/edit.png',
                      width: 20,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      'Edit Data',
                      style: GoogleFonts.poppins(
                          color: Colors.black, fontSize: 14),
                    ),
                  ],
                ),
              ),
              PopupMenuItem(
                value: 1,
                child: Row(
                  children: [
                    Image.asset(
                      'assets/delete.png',
                      width: 20,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      'Delete Data',
                      style:
                          GoogleFonts.poppins(color: Colors.red, fontSize: 14),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
