import 'package:flutter/material.dart';
import '../models/employee_model.dart';

class EmployeeListWidget extends StatelessWidget {
  const EmployeeListWidget({super.key, required this.lstEmployees});

  final List<EmployeeModel> lstEmployees;

  @override
  Widget build(BuildContext context) {
    return lstEmployees.isNotEmpty
        ? ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: lstEmployees.length,
            itemBuilder: (context, index) {
              final emp = lstEmployees[index];
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: ListTile(
                  leading: CircleAvatar(
                    child: Text(emp.fullName[0].toUpperCase()),
                  ),
                  title: Text(emp.fullName),
                  subtitle: Text("${emp.gender} • ${emp.department}"),
                  trailing: Text(
                    emp.id.substring(0, 6), // short uuid view
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ),
              );
            },
          )
        : Center(
            child: Text(
              "No Employees",
              style: TextStyle(fontSize: 22, color: Colors.grey.shade400),
            ),
          );
  }
}
