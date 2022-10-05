import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:todo_app/model/todo_model.dart';

import '../constants/app_colors.dart';
import '../controller/app_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final AppController appC = Get.put(AppController());
  @override
  Widget build(BuildContext context) {
    appC.userID.value= Get.arguments;
    return Scaffold(
      backgroundColor: AppColors.yellowPale,
      body:  GetBuilder<AppController>(
        init: AppController(),
        initState: (_) {},
        builder: (_) {
          return ListView.builder(
          itemCount: appC.todoList.length,
          itemBuilder: ((context, index) {
            String key = appC.todoList.keys.elementAt(index);
            TodoModel todo = appC.todoList[key];
            return GestureDetector(
              onTap: () {
                Get.toNamed('/update',arguments: key);
              },
              child: Container(
                  padding: EdgeInsets.all(20),
                  margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  color: AppColors.cyanDark,
                  child: Column(
                    children: [Text(todo.title), Text(todo.description)],
                  )),
            );
          }));
        },
      ),




      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed('/details');
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.navigation),
      ),
    );
  }
}
