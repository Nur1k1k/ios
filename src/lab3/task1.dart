class Student {
  String firstName;
  String lastName;
  double averageGrade;

  Student(this.firstName, this.lastName, this.averageGrade);
}

class Journal {
  List<Student> students = [];

  void addStudent(Student student) {
    students.add(student);
  }

  void removeStudent(String firstName, String lastName) {
    students.removeWhere((student) =>
    student.firstName == firstName && student.lastName == lastName);
  }

  void displayStudentsInfo() {
    students.sort((a, b) => b.averageGrade.compareTo(a.averageGrade));
    students.forEach((student) {
      print('Name: ${student.firstName} ${student.lastName}, GPA: ${student.averageGrade}');
    });
  }

  double calculateAverageGrade() {
    double totalGrade = 0.0;
    students.forEach((student) {
      totalGrade += student.averageGrade;
    });
    return totalGrade / students.length;
  }

  Student getStudentWithHighestGPA() {
    students.sort((a, b) => b.averageGrade.compareTo(a.averageGrade));
    return students.first;
  }
}

void main() {
  Journal journal = Journal();


  journal.addStudent(Student('John', 'Doe', 3.8));
  journal.addStudent(Student('Jane', 'Smith', 3.9));
  journal.addStudent(Student('Alice', 'Johnson', 3.7));

  print('Students Info:');
  journal.displayStudentsInfo();

  journal.removeStudent('John', 'Doe');

  print('\nStudents Info after removing John Doe:');
  journal.displayStudentsInfo();


  double averageGrade = journal.calculateAverageGrade();
  print('\nAverage Grade of all students: $averageGrade');

  Student highestGPAStudent = journal.getStudentWithHighestGPA();
  print('\nStudent with highest GPA: ${highestGPAStudent.firstName} ${highestGPAStudent.lastName}');
}
