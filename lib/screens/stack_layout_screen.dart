import 'package:flutter/material.dart';

class StackLayoutScreen extends StatelessWidget {
  const StackLayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stack Layout'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SafeArea(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: 400,
              width: 400,
              color: Colors.redAccent,
              child: const Text("I am Container 1"),
            ),
            Positioned(
              top: 1,
              right: 1,
              child: Container(
                height: 100,
                width: 100,
                color: Colors.black,
                child: const Text(
                  "I am Container 2",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Positioned(
              bottom: -20,
              right: 400 / 2 - 50,
              child: Container(
                height: 100,
                width: 100,
                color: Colors.blueAccent,
                child: const Text("I am Container 2"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
