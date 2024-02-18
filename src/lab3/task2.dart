class Task {
  String title;
  String description;
  bool isCompleted;

  Task(this.title, this.description, this.isCompleted);
}

class ToDoList {
  List<Task> tasks = [];

  void addTask(Task task) {
    tasks.add(task);
  }

  void removeTask(String title) {
    tasks.removeWhere((task) => task.title == title);
  }

  void changeTaskStatus(String title, bool isCompleted) {
    var n = null;
    var task = tasks.firstWhere((task) => task.title == title, orElse: () => n);
    if (task != n) {
      task.isCompleted = isCompleted;
    }
  }

  void displayAllTasks() {
    print('All Tasks:');
    tasks.forEach((task) {
      print('Title: ${task.title}, Description: ${task.description}, Completed: ${task.isCompleted ? "Yes" : "No"}');
    });
  }

  void displayCompletedTasks() {
    var completedTasks = tasks.where((task) => task.isCompleted).toList();
    print('Completed Tasks:');
    completedTasks.forEach((task) {
      print('Title: ${task.title}, Description: ${task.description}');
    });
  }

  void displayOutstandingTasks() {
    var outstandingTasks = tasks.where((task) => !task.isCompleted).toList();
    print('Outstanding Tasks:');
    outstandingTasks.forEach((task) {
      print('Title: ${task.title}, Description: ${task.description}');
    });
  }

  void clearCompletedTasks() {
    tasks.removeWhere((task) => task.isCompleted);
  }
}

void main() {
  ToDoList toDoList = ToDoList();

  // Adding tasks
  toDoList.addTask(Task('Task 1', 'Description 1', true));
  toDoList.addTask(Task('Task 2', 'Description 2', true));
  toDoList.addTask(Task('Task 3', 'Description 3', false));

  // Displaying all tasks
  toDoList.displayAllTasks();

  // Displaying completed tasks
  toDoList.displayCompletedTasks();

  // Displaying outstanding tasks
  toDoList.displayOutstandingTasks();

  // Clearing completed tasks
  toDoList.clearCompletedTasks();

  // Displaying all tasks after clearing completed tasks
  toDoList.displayAllTasks();
}
