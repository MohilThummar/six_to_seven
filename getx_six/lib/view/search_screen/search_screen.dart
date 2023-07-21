import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_six/utils/routes/routes_name.dart';

class SearchScreen extends GetView<SearchController> {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search Screen"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Get.back();
              },
              child: const Text("Go Back"),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                Get.offNamed(RoutesName.postScreen);
              },
              child: const Text("Replace Screen"),
            ),
          ],
        ),
      ),
    );
  }
}
