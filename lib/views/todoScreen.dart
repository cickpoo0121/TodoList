import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:state/controllers/todoController.dart';
import 'package:state/views/todoUpdateScreen.dart';

class TodoScreen extends StatelessWidget {
  TodoController _todoController = Get.put(TodoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
      ),
      body: Obx(
        () => ListView.separated(
          itemBuilder: (BuildContext context, int index) => ListTile(
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
                      color: Colors.red, decoration: TextDecoration.lineThrough)
                  : TextStyle(color: Colors.black),
            ),
            trailing: IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                Get.to(TodoUpdateScreen(), arguments: index);
              },
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
