import 'package:flutter/material.dart';
import 'package:flutter_for_college/models/student_model.dart';
import 'package:flutter_for_college/widgets/listview_widget.dart';

class OutputScreen extends StatelessWidget {
  final List<StudentModel> lstStudents;

  const OutputScreen({super.key, required this.lstStudents});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Output Screen'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: lstStudents.isNotEmpty
            ? ListViewWidget(lstStudents: lstStudents)
            : const Text(
                "No Data",
                style: TextStyle(fontSize: 24, color: Colors.grey),
              ),
      ),
    );
  }
}
