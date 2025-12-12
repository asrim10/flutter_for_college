import 'package:flutter/material.dart';
import 'package:flutter_for_college/screens/dashboard_screen.dart';
import 'package:flutter_for_college/theme/theme_data.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Apps for College',
      debugShowCheckedModeBanner: false,
      theme: getApplicationTheme(),
      home: const DashboardScreen(),
    );
  }
}
