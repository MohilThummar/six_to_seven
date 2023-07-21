import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_six/utils/routes/routes_name.dart';

import 'utils/routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // initialBinding: ,
      getPages: AppRoutes.getPages,
      initialRoute: RoutesName.splashScreen,
    );
  }
}
