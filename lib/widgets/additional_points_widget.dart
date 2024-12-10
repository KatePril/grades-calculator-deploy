import 'package:flutter/material.dart';
import 'package:grades_calculator/entities/additional_points.dart';
import 'package:grades_calculator/widgets/grade_cell.dart';

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
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.primary,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text(
                  "Additional points",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Text(
                    "Total: ${widget.additionalPoints.total().toStringAsFixed(1)}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: [
                for (int i = 0; i < widget.additionalPoints.points.length; i++)
                  GradeCell(
                    grade: widget.additionalPoints.points[i],
                    onGradeChanged: (newGrade) =>
                      setState(() {
                        widget.additionalPoints.points[i] = newGrade;
                        widget.onGradeChanged();
                      }),
                  ),
                SizedBox(
                  width: 80,
                  child: IconButton(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    icon: const Icon(Icons.add),
                    tooltip: "Add points",
                    onPressed: () =>
                      setState(() {
                        widget.additionalPoints.points.add("0");
                        widget.onGradeChanged();
                      }),
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
