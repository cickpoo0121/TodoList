import 'package:state/models/todoModel.dart';
import 'package:get/get.dart';

class TodoController extends GetxController {
  // Array of Todo
  // List<Todo> todos;
  // RxList<Todo> todos;
  var todos = <Todo>[].obs;

  // toggle checkbox status of a selected task
  void updateStatus(int index, bool status) {
    // get the selected task
    var task = todos[index];
    // update the task
    task.status = status;
    // update mumber of obs list
    todos[index] = task;
    // todos[index].status = status;
  }

  // update the task's title
  void updateTitle(int index, String title) {
    // get the selected task
    var task = todos[index];
    // update the task
    task.title = title;
    // update mumber of obs list
    todos[index] = task;
    // todos[index].status = status;
  }
}
