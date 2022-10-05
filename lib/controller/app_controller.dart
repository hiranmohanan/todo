import 'dart:convert';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:todo_app/model/todo_model.dart';

class Authentication extends ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
}

class AppController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    ever(userID, (value) {
      getTodo();
    });
    super.onInit();
  }

  RxString userID = "Unknown".obs;
  Map todoList = {};
  addTodo(TextEditingController title, TextEditingController body) async {
    if (title.text.isEmpty) {
      Get.snackbar(
        "title Needed",
        "Add a New Title",
      );

      return;
    }
    if (body.text.isEmpty) {
      Get.snackbar(
        "Description Needed",
        "Add a Description",
      );
      return;
    }
    DatabaseReference ref = FirebaseDatabase.instance.ref("users/$userID");
    await ref.push().set({
      "title": title.text,
      "description": body.text,
    });
    getTodo();
    Get.back();
  }

  profileTodo(TextEditingController name, TextEditingController email) async {
    final ref = FirebaseDatabase.instance.ref();
    await ref.set({
      "name": name.text,
      "email": email.text,
    });
  }

  updateTodo(TextEditingController title, TextEditingController body,
      String key) async {
    if (title.text.isEmpty) {
      Get.snackbar(
        "title Needed",
        "Add a New Title",
      );

      return;
    }
    if (body.text.isEmpty) {
      Get.snackbar(
        "Description Needed",
        "Add a Description",
      );
      return;
    }
    DatabaseReference ref = FirebaseDatabase.instance.ref("users/$userID/$key");
    await ref.set({
      "title": title.text,
      "description": body.text,
    });
    getTodo();
    Get.back();
  }

  deleteTodo(String key) async {
    final ref = FirebaseDatabase.instance.ref();
    await ref.child('users/$userID/$key').remove().then((value) {
      getTodo();
      Get.back();
    });
  }

  Future getTodo() async {
    final ref = FirebaseDatabase.instance.ref();
    final snapshot = await ref.child('users/$userID').get();
    if (snapshot.exists) {
      todoList = todoModelFromJson(jsonEncode(snapshot.value!));
      update();
    } else {
      print('No data available.');
    }
  }
}
