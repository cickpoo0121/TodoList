import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:state/controllers/todoController.dart';
import 'package:state/views/todoUpdateScreen.dart';

class TodoScreen extends StatelessWidget {
  // save object to memory by Get.put and Get.find to call || for using in every page
  TodoController _todoController = Get.put(TodoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
      ),
      body: Obx(
        () => ListView.separated(
          itemBuilder: (BuildContext context, int index) => Dismissible(
            // Dismissible widget requires unique key || Key(index.toString())
            key: UniqueKey(),
            background: Container(
              color: Colors.red,
            ),
            onDismissed: (_) {
              // keep the task
              var removed = _todoController.todos[index];
              // delete the selected item
              _todoController.todos.removeAt(index);
              // show snackbar
              Get.snackbar(
                'Task removed',
                removed.title,
                snackPosition: SnackPosition.TOP,
                mainButton: TextButton(
                  onPressed: () {
                    // undo by inserting the removed data
                    _todoController.todos.insert(index, removed);
                    // hide snackbar immediately
                    Get.back();
                  },
                  child: Text(
                    'undo',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              );
            },

            child: ListTile(
              leading: Checkbox(
                value: _todoController.todos[index].status,
                onChanged: (bool status) {
                  _todoController.updateStatus(index, status);
                },
              ),
              title: Text(
                '${_todoController.todos[index].title}',
                style: _todoController.todos[index].status
                    ? TextStyle(
                        color: Colors.red,
                        decoration: TextDecoration.lineThrough)
                    : TextStyle(color: Colors.black),
              ),
              trailing: IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  Get.to(() => TodoUpdateScreen(), arguments: index);
                },
              ),
            ),
          ),
          separatorBuilder: (BuildContext context, int index) => Divider(),
          itemCount:
              _todoController.todos == null ? 0 : _todoController.todos.length,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Get.to(() => TodoUpdateScreen());
        },
      ),
    );
  }
}
