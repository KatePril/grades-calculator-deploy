import 'package:flutter/material.dart';

class GradeCell extends StatefulWidget {
  final String grade;
  final ValueChanged<String> onGradeChanged;

  const GradeCell({
    super.key,
    required this.grade,
    required this.onGradeChanged,
  });

  @override
  _GradeCellState createState() => _GradeCellState();
}

class _GradeCellState extends State<GradeCell> {
  late TextEditingController gradeController;

  @override
  void initState() {
    super.initState();
    gradeController = TextEditingController(text: widget.grade);
  }

  @override
  void dispose() {
    gradeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      child: TextField(
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          labelText: 'Grade',
        ),
        controller: gradeController,
        onChanged: (value) {
          widget.onGradeChanged(value);
        },
      ),
    );
  }
}
