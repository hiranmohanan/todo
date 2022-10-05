import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:todo_app/model/todo_model.dart';

import '../constants/app_colors.dart';
import '../controller/app_controller.dart';

class ModifyScreen extends StatelessWidget {
  ModifyScreen({Key? key}) : super(key: key);
  final TextEditingController titleTEC = TextEditingController();
  final AppController appC = Get.put(AppController());
  final TextEditingController bodyTEC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var key = Get.arguments;
    TodoModel todo = appC.todoList[key];
    titleTEC.text = todo.title;
    bodyTEC.text = todo.description;
    return Scaffold(
      backgroundColor: AppColors.yellowPale,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 50,
            width: 100.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () async {
                      appC.updateTodo(titleTEC, bodyTEC,key);
                      // await appC.getTodo();
                    },
                    child: Text("Update")),
                ElevatedButton(
                    onPressed: () async {
                      appC.deleteTodo(key);
                      // await appC.getTodo();
                    },
                    child: Text("Delete"))
              ],
            ),
          ),
          TextField(
            controller: titleTEC,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Title',
            ),
          ),
          TextField(
            controller: bodyTEC,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Details',
            ),
          ),
        ],
      ),
    );
  }
}
