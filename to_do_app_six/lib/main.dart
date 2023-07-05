import 'package:flutter/material.dart';
import 'package:to_do_app_six/res/constant/app_colors.dart';
import 'package:to_do_app_six/res/constant/app_strings.dart';
import 'package:to_do_app_six/view/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: AppColors.materialPrimaryColor,
      ),
      home: const SplashScreen(),
    );
  }
}
