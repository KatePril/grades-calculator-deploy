import 'package:flutter/material.dart';
import 'package:grades_calculator/additional_points.dart';
import 'package:grades_calculator/additional_points_widget.dart';
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
  AdditionalPoints additionalPoints = AdditionalPoints();
  double avg = 0;
  double points = 0;
  double total = 0;

  void _addSubject() {
    setState(() {
      subjects.add(Subject());
    });
  }

  void _avgAcademicGrade() {
    double sumGrade = subjects
        .map((subject) => subject.total())
        .reduce((a, b) => a + b);
    setState(() {
      avg = sumGrade / subjects.length;
      _updateTotal();
    });
  }

  void _multipliedPoints() {
    setState(() {
      points = additionalPoints.total() * 0.05;
      _updateTotal();
    });
  }

  void _updateTotal() {
    total = avg + points;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 4.0),
              decoration: BoxDecoration(
                color:Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Text(
                "Average academic grade: $avg",
                style: const TextStyle(color: Colors.white),
              ),
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 4.0),
              decoration: BoxDecoration(
                color:Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Text(
                "Additional points: $points",
                style: const TextStyle(color: Colors.white),
              ),
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 4.0),
              decoration: BoxDecoration(
                color:Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Text(
                "Total score: $total",
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: subjects.length,
                itemBuilder: (context, index) {
                  return SubjectWidget(
                    subject: subjects[index],
                    onGradeChanged: _avgAcademicGrade,
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity, // Make the widget take full width
                child: AdditionalPointsWidget(
                  additionalPoints: additionalPoints,
                  onGradeChanged: _multipliedPoints,
                ),
              ),
            ),
          ],
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
