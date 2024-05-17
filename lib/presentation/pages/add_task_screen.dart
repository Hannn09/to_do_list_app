import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddTaskScreen extends StatefulWidget {
  final String? name;
  final String? desc;

  const AddTaskScreen({super.key, this.name, this.desc});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final TextEditingController _nameTextFieldController =
      TextEditingController();

  final TextEditingController _descTextFieldController =
      TextEditingController();

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
                controller: _nameTextFieldController,
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
                controller: _descTextFieldController,
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
                  onPressed: getDataToBack,
                  child: Text(
                    'Submit',
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

  void getDataToBack() {
    Navigator.pop(context, {
      'name': _nameTextFieldController.text,
      'desc': _descTextFieldController.text
    });
    _nameTextFieldController.clear();
    _descTextFieldController.clear();
  }
}
