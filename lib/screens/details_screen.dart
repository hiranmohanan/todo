import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:todo_app/controller/app_controller.dart';

import '../constants/app_colors.dart';

class DetailsScreen extends StatelessWidget {
  DetailsScreen({Key? key}) : super(key: key);
  final AppController appC = Get.put(AppController());
  final TextEditingController titleTEC = TextEditingController();
  
  final TextEditingController bodyTEC = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.yellowPale,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
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
          ElevatedButton(
              onPressed: () async {
                appC.addTodo(titleTEC, bodyTEC);
               // await appC.getTodo();
              },
              child: Text("Add"))
        ],
      ),
    );
  }
}
