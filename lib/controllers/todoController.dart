import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:state/models/todoModel.dart';
import 'package:get/get.dart';

class TodoController extends GetxController {
  // Array of Todo
  // List<Todo> todos;
  // RxList<Todo> todos;
  var todos = <Todo>[].obs;

  @override
  void onInit() {
    super.onInit();
    print('Controller is created');

    // ======== Load data ===========
    // 1. Load data from local storage
    // List<Map<String,dynamic>>
    List todosSave = GetStorage().read('todos');

    if (todosSave != null) {
      print('==================>> Data loaded');
      // print(todosSave);
      // Our loaded datat is a List of Map
      //  [{title: task1, status: false}]
      // 2.Convert List of Map to List of todo Object

      // ---------------- Method 1 -------------------
      /*List<Todo> todoTemp = [];
      for (int i = 0; i < todosSave.length; i++) {
        // Map<String, dynamic> task = todosSave[i];
        todoTemp.add(Todo(title: todosSave[i]['title'], status: todosSave[i]['status']));
      }
      // print(todoTemp);
      // 3. Convert List of Todo object to obs
      todos = todoTemp.obs;
      */

      // ---------------- Method 2 -------------------
      // Iterable x = todosSave.map((task) {
      //   // convert Map to Todo
      //   return Todo(title: task['title'], status: task['status']);
      // });

      // Iterable x = todosSave.map((task) => Todo(title: task['title'], status: task['status']));
      // List<Todo> todoTemp = x.toList();

      // List<Todo> todoTemp = todosSave
      //     .map((task) => Todo(title: task['title'], status: task['status']))
      //     .toList();

      // todos = todoTemp.obs;

      // todos = todosSave
      //     .map((task) => Todo(title: task['title'], status: task['status']))
      //     .toList()
      //     .obs;

      // ---------------- Method 3 -------------------
      // todos = todosSave
      //     .map((task) => Todo().fromJson(task))
      //     .toList()
      //     .obs;

      todos = todosSave.map((task) => Todo.fromJson(task)).toList().obs;
    }

    // ======== Create worker to listen to todos changes ===========
    ever(todos, (_) {
      print('==================>> Save data');
      // ======== Save data ===========
      /*
      // ------------------ Method 1 -----------------------------
      // 1/ convert obs to simple list
      List<Todo> todosList = todos.toList();

      // 2. convert the member object to json
      List<String> todosJson = [];
      for (int i = 0; i < todos.length; i++) {
        todosJson.add(todosList[i]
            .toJSON()); //toJSON() is method that created in todo model
      }

      // 3.convert the entrie list to json
      String todosSave = jsonEncode(todosJson);
      print(todosSave);

      // 4. save data
      // GetStorage().write('todo', todosSave);
      // print('data changed');
      */

      // ------------------ Method 2 -----------------------------
      /*
      // 1. convert obs to simplw list
      List<Todo> todosList = todos.toList();

      // 2. convert an entrie list to json
      String todosSave = jsonEncode(todosList);
      print(todosSave);

      // 3. save json to stroage
      GetStorage().write('todos', todosSave);
      */

      // ------------------ Method 3 -----------------------------
      /*
      // 1. convert obs to simple list
      List<Todo> todosList = todos.toList();

      // 2.save data
      GetStorage().write('todos', todosList);
      */

      // ------------------ Method 4 -----------------------------
      // write() will use jsonEncode()
      GetStorage().write('todos', todos.toList());
    });
  }

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
