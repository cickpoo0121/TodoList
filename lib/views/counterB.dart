import 'package:flutter/material.dart';
import 'package:state/controllers/counterController.dart';
import 'package:get/get.dart';

class CounterB extends StatelessWidget {
// find the previous saved controller
  CounterController _counterController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Page B'),
        ),
        body: Center(
          child: Container(
            child: Obx(() => Text('Count = ${_counterController.count}')),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            _counterController.add();
          },
        ));
  }
}
