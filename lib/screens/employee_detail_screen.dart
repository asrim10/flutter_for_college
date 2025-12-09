import 'package:flutter/material.dart';
import 'package:flutter_for_college/widgets/employye_list_widget.dart';
import 'package:uuid/uuid.dart';
import '../models/employee_model.dart';

class EmployeeDetailScreen extends StatefulWidget {
  const EmployeeDetailScreen({super.key});

  @override
  State<EmployeeDetailScreen> createState() => _EmployeeDetailScreenState();
}

class _EmployeeDetailScreenState extends State<EmployeeDetailScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();

  String? _selectedGender;
  String? _selectedDepartment;

  final uuid = const Uuid();
  final List<EmployeeModel> _lstEmployees = [];

  final List<String> _genders = ["Male", "Female", "Other"];
  final List<String> _departments = [
    "HR",
    "Finance",
    "IT",
    "Marketing",
    "Sales",
  ];

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void _addEmployee() {
    if (_formKey.currentState!.validate()) {
      String empId = uuid.v4(); // Auto-generate UUID

      EmployeeModel emp = EmployeeModel(
        id: empId,
        fullName: _nameController.text.trim(),
        gender: _selectedGender!,
        department: _selectedDepartment!,
      );

      setState(() {
        _lstEmployees.add(emp);
      });

      _nameController.clear();
      _selectedGender = null;
      _selectedDepartment = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Employee Details"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Full Name
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: "Full Name",
                  prefixIcon: const Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade50,
                ),
                validator: (value) =>
                    value == null || value.isEmpty ? "Enter full name" : null,
              ),

              const SizedBox(height: 20),

              // Gender Dropdown
              DropdownButtonFormField(
                value: _selectedGender,
                items: _genders
                    .map((g) => DropdownMenuItem(value: g, child: Text(g)))
                    .toList(),
                decoration: InputDecoration(
                  labelText: "Gender",
                  prefixIcon: const Icon(Icons.wc),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade50,
                ),
                onChanged: (value) => _selectedGender = value,
                validator: (value) => value == null ? "Select gender" : null,
              ),

              const SizedBox(height: 20),

              // Department Dropdown
              DropdownButtonFormField(
                value: _selectedDepartment,
                items: _departments
                    .map((d) => DropdownMenuItem(value: d, child: Text(d)))
                    .toList(),
                decoration: InputDecoration(
                  labelText: "Department",
                  prefixIcon: const Icon(Icons.business_center),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade50,
                ),
                onChanged: (value) => _selectedDepartment = value,
                validator: (value) =>
                    value == null ? "Select department" : null,
              ),

              const SizedBox(height: 30),

              // Add Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: _addEmployee,
                  icon: const Icon(Icons.add),
                  label: const Text("Add Employee"),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 40),

              // Employee List Widget (same reusability)
              EmployeeListWidget(lstEmployees: _lstEmployees),
            ],
          ),
        ),
      ),
    );
  }
}
