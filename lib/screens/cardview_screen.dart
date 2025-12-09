import 'package:flutter/material.dart';
import 'package:flutter_for_college/models/student_model.dart';
import 'package:flutter_for_college/widgets/card_widget.dart';

class CardViewScreen extends StatelessWidget {
  const CardViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<StudentModel> students = [
      StudentModel(fname: 'Aryan', lname: 'Nakarmi', city: 'Kathmandu'),
      StudentModel(fname: 'Asrim', lname: 'Suwal', city: 'Bhatkapur'),
      StudentModel(fname: 'Ishan', lname: 'Dhami', city: 'Kathmandu'),
      StudentModel(fname: 'Amit', lname: 'Khayargoli', city: 'Bhaktapur'),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('CardView'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView.builder(
        itemCount: students.length,
        itemBuilder: (context, index) {
          final student = students[index];
          return CardWidget(student: student);
        },
      ),
    );
  }
}
