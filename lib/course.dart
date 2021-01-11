class Course {
  String name;
  List<double> grades;

  Course(this.name) : grades = <double>[];

  void addGrade(double grade) {
    grades.add(grade);
  }

  void total() {
    var exams = grades.length;
    var avg = grades.reduce((value, element) => value + element) / exams;
    print('$name - $exams - $avg avg');
  }
}
