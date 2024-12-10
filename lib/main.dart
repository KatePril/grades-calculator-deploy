import 'package:flutter/material.dart';
import 'package:grades_calculator/entities/additional_points.dart';
import 'package:grades_calculator/widgets/additional_points_widget.dart';
import 'package:grades_calculator/entities/subject.dart';
import 'package:grades_calculator/widgets/home_page.dart';
import 'package:grades_calculator/widgets/subject_widget.dart';
import 'package:grades_calculator/widgets/title_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grades',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Grade calculator'),
    );
  }
}

