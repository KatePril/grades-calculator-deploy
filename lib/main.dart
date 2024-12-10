import 'package:flutter/material.dart';
import 'package:grades_calculator/subject.dart';
import 'package:grades_calculator/subject_widget.dart';

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

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Subject> subjects = List.empty(growable: true);
  double avg = 0;

  void _addSubject() {
    setState(() {
      subjects.add(Subject());
    });
  }

  void avgAcademicGrade() {
    double sumGrade = subjects
        .map((subject) => subject.total())
        .reduce((a, b) => a + b);
    setState(() {
      avg = sumGrade / subjects.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Your average academic grade is: $avg; additional points: "),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: subjects.length,
          itemBuilder: (context, index) {
            return SubjectWidget(
              subject: subjects[index],
              onGradeChanged: avgAcademicGrade,
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addSubject,
        tooltip: 'Add subject',
        child: const Icon(Icons.add),
      ),
    );
  }
}
