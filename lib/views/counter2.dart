import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Counter2 extends StatelessWidget {
  var _count = 0.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter2'),
      ),
      body: Center(
        child: Obx(()=>Text('Count = ${_count.value}')),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _count.value++;
        },
      ),
    );
  }
}
