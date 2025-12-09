import 'package:flutter/material.dart';
import 'package:flutter_for_college/models/student_model.dart';

class CardWidget extends StatelessWidget {
  final StudentModel student;

  const CardWidget({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: Card(
        color: Colors.amber,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 8,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "First name: ${student.fname}",
              style: TextStyle(fontSize: 24, color: Colors.grey),
            ),
            Text(
              "Last name: ${student.lname}",
              style: TextStyle(fontSize: 24, color: Colors.grey),
            ),
            Text(
              "City : ${student.city}",
              style: TextStyle(fontSize: 24, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
