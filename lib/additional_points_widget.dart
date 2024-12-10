import 'package:flutter/material.dart';
import 'package:grades_calculator/additional_points.dart';
import 'package:grades_calculator/grade_cell.dart';

class AdditionalPointsWidget extends StatefulWidget {
  final Function onGradeChanged;
  final AdditionalPoints additionalPoints;

  const AdditionalPointsWidget({
    super.key,
    required this.additionalPoints,
    required this.onGradeChanged,
  });

  @override
  _AdditionalPointsWidgetState createState() => _AdditionalPointsWidgetState();
}

class _AdditionalPointsWidgetState extends State<AdditionalPointsWidget> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
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
            const Text("Additional points"),
            const SizedBox(height: 10),
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: [
                for (int i = 0; i < widget.additionalPoints.points.length; i++)
                  GradeCell(
                    grade: widget.additionalPoints.points[i],
                    onGradeChanged: (newGrade) {
                      setState(() {
                        widget.additionalPoints.points[i] = newGrade;
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
                        widget.additionalPoints.points.add("0");
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
