import 'package:students/course.dart';

class Student {
  String name;
  List<Course> courses;

  Student(this.name) : courses = <Course>[];

  void addGrade(String course, double grade) {
    var c = courses.firstWhere((item) => item.name == course, orElse: () {
      var item = Course(course);
      courses.add(item);
      return item;
    });
    c.addGrade(grade);
  }

  void totals() {
    print('Grades for $name');
    courses.forEach((c) => c.total());
    print('Done');
  }
}
