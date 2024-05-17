import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/task.dart';

class UpdateTaskScreen extends StatefulWidget {
  final Task task;
  const UpdateTaskScreen({super.key, required this.task});

  @override
  State<UpdateTaskScreen> createState() => _UpdateTaskScreenState();
}

class _UpdateTaskScreenState extends State<UpdateTaskScreen> {
  final TextEditingController name = TextEditingController();

  final TextEditingController desc = TextEditingController();

  @override
  void initState() {
    name.text = widget.task.name!;
    desc.text = widget.task.desc!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "Create New Task",
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500, color: Colors.black, fontSize: 18),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text(
                "Title",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                cursorColor: Colors.lightBlue[200],
                controller: name,
                decoration: InputDecoration(
                    border: const OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.lightBlue, width: 2.0),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.lightBlue, width: 2.0),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    hintText: 'Enter Title',
                    hintStyle: GoogleFonts.poppins(color: Colors.grey[400])),
              ),
              const SizedBox(height: 30),
              Text(
                "Description",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                maxLines: 3,
                controller: desc,
                decoration: InputDecoration(
                    border: const OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.lightBlue, width: 2.0),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.lightBlue, width: 2.0),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    hintText: 'Enter Description',
                    hintStyle: GoogleFonts.poppins(color: Colors.grey[400])),
              ),
              const Spacer(),
              Container(
                margin: const EdgeInsets.only(bottom: 30),
                height: 50,
                width: MediaQuery.sizeOf(context).width,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        WidgetStateProperty.all(Colors.lightBlue[200]),
                    shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  onPressed: () {
                    updateDataTask(name.text, desc.text);
                  },
                  child: Text(
                    'Edit',
                    style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void updateDataTask(String newName, String newDesc) {
    Navigator.pop(context, {'name': newName, 'desc': newDesc});
  }
}
