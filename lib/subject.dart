class Subject {
  String title = "";
  List<String> grades = List.empty(growable: true);

  double parseGrade(String grade) {
    try {
      return double.parse(grade);
    } catch (object) {
      return 0;
    }
  }

  double total() {
    return grades.map(parseGrade).reduce((a, b) => a + b);
  }
}