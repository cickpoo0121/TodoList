import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:state/views/counterA.dart';
import 'package:get/get.dart';
import 'package:state/views/todoScreen.dart';

void main() async {
  await GetStorage.init();
  runApp(
    GetMaterialApp(
      home: TodoScreen(),
    ),
  );
}
