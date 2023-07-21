import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxInt count = 0.obs;

  Rx<TextEditingController> emailController = TextEditingController().obs;

  increment() {
    count++;
    emailController.value.text = "$count";
    debugPrint("Count is : $count");
  }
}
