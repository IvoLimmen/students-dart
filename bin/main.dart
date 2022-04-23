import 'dart:io';
import 'package:students/student.dart';

void help() {
  print('Grading system');
  print('add-student [name] - Add student');
  print('select-student [name] - Select a student');
  print(
      'add-grade [course] [grade] - Add a grade for a course for the current selected student');
  print('end - Stop the program');
}

void main(List<String> arguments) {
  var students = <Student?>[];
  Student? student;
  String? command;

  while (command != 'end') {
    command = stdin.readLineSync();

    if (command == null) {
      print('Please enter a valid command');
      help();
    } else if (command.startsWith('add-student')) {
      var name = command.substring(11).trim();
      student = students.firstWhere((s) => s?.name == name, orElse: () {
        student = Student(name);
        students.add(student);
        return student;
      });
    } else if (command.startsWith('select-student')) {
      var name = command.substring(14).trim();
      student = students.firstWhere((s) => s?.name == name, orElse: () {
        return null;
      });
      if (student == null) {
        print('Student $name not found');
      } else {
        print('Student $name is selected');
      }
    } else if (command.startsWith('add-grade')) {
      var args = command.substring(9).trim().split(' ');
      if (student == null) {
        print('No student selected, can not add a grade');
      } else {
        student?.addGrade(args[0], double.parse(args[1]));
      }
    } else if (command == 'help') {
      help();
    } else {
      print('Unknown command: $command');
      help();
    }
  }

  students.forEach((s) => s?.totals());
}
