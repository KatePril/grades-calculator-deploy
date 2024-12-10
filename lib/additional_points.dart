class AdditionalPoints {
  String title = "";
  List<String> points = List.empty(growable: true);

  double parseGrade(String grade) {
    try {
      return double.parse(grade);
    } catch (object) {
      return 0;
    }
  }

  double total() {
    if (points.isEmpty) {
      return 0;
    }
    return points.map(parseGrade).reduce((a, b) => a + b) * 0.05;
  }
}