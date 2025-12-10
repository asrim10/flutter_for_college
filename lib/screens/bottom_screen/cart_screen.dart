import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _pController = TextEditingController();
  final TextEditingController _tController = TextEditingController();
  final TextEditingController _rController = TextEditingController();

  double? si;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Simple Interest Calculator")),
      body: SizedBox.expand(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _pController,
                  decoration: const InputDecoration(
                    labelText: "Principal (P)",
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter principal amount";
                    }
                    if (double.tryParse(value) == null) {
                      return "Enter valid number";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 16),

                TextFormField(
                  controller: _tController,
                  decoration: const InputDecoration(
                    labelText: "Time (T in years)",
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter time";
                    }
                    if (double.tryParse(value) == null) {
                      return "Enter valid number";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 16),

                TextFormField(
                  controller: _rController,
                  decoration: const InputDecoration(
                    labelText: "Rate (R %)",
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter rate";
                    }
                    if (double.tryParse(value) == null) {
                      return "Enter valid number";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 20),

                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      double p = double.parse(_pController.text);
                      double t = double.parse(_tController.text);
                      double r = double.parse(_rController.text);

                      setState(() {
                        si = (p * t * r) / 100;
                      });
                    }
                  },
                  child: const Text("Calculate Simple Interest"),
                ),

                const SizedBox(height: 20),

                if (si != null)
                  Text(
                    "Simple Interest: Rs.${si!.toStringAsFixed(2)}",
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
