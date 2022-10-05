import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/app_colors.dart';
import '../controller/app_controller.dart';

class User extends StatelessWidget {
  User({Key? key}) : super(key: key);
  final AppController appC = Get.put(AppController());
  final TextEditingController phoneTEC = TextEditingController();
  final TextEditingController emailTEC = TextEditingController();
  final TextEditingController nameTEC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.yellowPale,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: nameTEC,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'name',
              ),
            ),
            TextField(
              controller: emailTEC,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'email',
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  if (emailTEC.text.isEmpty || !emailTEC.text.isEmail) {
                    Get.snackbar(
                      "email Needed",
                      "Enter a valid email",
                    );

                    return;
                  }
                  appC.profileTodo(nameTEC, emailTEC);
                  Get.toNamed('/', arguments: phoneTEC.text);
                },
                child: Text("Submit")),
          ],
        ));
  }
}
