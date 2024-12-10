import 'package:flutter/material.dart';
import 'package:grades_calculator/grade_cell.dart';
import 'package:grades_calculator/subject.dart';

class SubjectWidget extends StatefulWidget {
  final Subject subject;
  final Function onGradeChanged;

  const SubjectWidget({
    super.key,
    required this.subject,
    required this.onGradeChanged,
  });

  @override
  _SubjectWidgetState createState() => _SubjectWidgetState();
}

class _SubjectWidgetState extends State<SubjectWidget> {
  late TextEditingController titleController;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.subject.title);
  }

  @override
  void dispose() {
    titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: titleController,
                    decoration: const InputDecoration(
                      labelText: 'Subject Title',
                    ),
                    onChanged: (value) {
                      setState(() {
                        widget.subject.title = value;
                      });
                    },
                  ),
                ),
                const SizedBox(width: 8),
                // Total Score
                Text(
                  'Total: ${widget.subject.total()}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: [
                for (int i = 0; i < widget.subject.grades.length; i++)
                  GradeCell(
                    grade: widget.subject.grades[i],
                    onGradeChanged: (newGrade) {
                      setState(() {
                        widget.subject.grades[i] = newGrade;
                        widget.onGradeChanged();
                      });
                    },
                  ),
                SizedBox(
                  width: 80,
                  child: IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      setState(() {
                        widget.subject.grades.add("0");
                        widget.onGradeChanged();
                      });
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
