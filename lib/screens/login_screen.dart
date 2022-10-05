import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../constants/app_colors.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final TextEditingController phoneTEC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.yellowPale,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: phoneTEC,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Phone Number',
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  if (phoneTEC.text.isEmpty || !phoneTEC.text.isPhoneNumber) {
                    Get.snackbar(
                      "Phone number Needed",
                      "Enter a valid Phone number",
                    );
                    return;
                  }
                  Get.toNamed('/',arguments:phoneTEC.text);
                },
                child: Text("Sent OTP"))
          ],
        ));
  }
}
