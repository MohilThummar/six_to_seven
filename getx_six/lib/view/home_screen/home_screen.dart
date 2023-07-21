import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_six/utils/routes/routes_name.dart';
import 'package:getx_six/view/home_screen/home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() {
              return Text(
                "Count: ${controller.count}",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              );
            }),
            const SizedBox(height: 15),
            Obx(() {
              return Text(
                "Text Count: ${controller.emailController.value.text}",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              );
            }),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(RoutesName.searchScreen);
              },
              child: const Text("Next Screen"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.increment,
        child: const Icon(Icons.add_rounded),
      ),
    );
  }
}
