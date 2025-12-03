import 'package:flutter/material.dart';
import 'package:flutter_for_college/models/student_model.dart';

class ListViewWidget extends StatelessWidget{
  const ListViewWidget ({super.key, required this.lstStudents});

  final List<StudentModel> lstStudents;

  @override
  Widget build(BuildContext context) {
    return lstStudents.isNotEmpty
        ? ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: lstStudents.length,
        itemBuilder: (context, index){
          final student = lstStudents[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              leading: CircleAvatar(
                child: Text(student.fname[0].toUpperCase()),
              ),
              title: Text('${student.fname} ${student.lname}'),
              subtitle: Text(student.city),
              trailing: Wrap(

              ),
            ),
          );

        },
    ): Center(
      child: Text(
        "No Data",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 24, color: Colors.grey.shade400),
      ),
    );
  }
}