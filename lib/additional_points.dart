class AdditionalPoints {
  String title = "";
  List<String> points = List.empty(growable: true);

  double parsePoint(String grade) {
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
    return points.map(parsePoint).reduce((a, b) => a + b);
  }
}