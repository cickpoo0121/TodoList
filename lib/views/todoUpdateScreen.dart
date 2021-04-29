import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:state/controllers/todoController.dart';
import 'package:state/models/todoModel.dart';

class TodoUpdateScreen extends StatelessWidget {
  TodoController _todoController = Get.find();
  TextEditingController _tcTask = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // get passing data
    int index = Get.arguments;
    // add or edit?
    if (index != null) {
      _tcTask.text = _todoController.todos[index].title;
      
    }

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: TextField(
                  controller: _tcTask,
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: 'What to do?',
                    border: InputBorder.none,
                  ),
                  maxLines: 50,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: Text('Cancel'),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        _todoController.todos.add(Todo(title: _tcTask.text));
                        Get.back();
                      },
                      child: Text('Add')),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
