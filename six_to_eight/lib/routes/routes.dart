import 'package:flutter/material.dart';
import 'package:six_to_eight/routes/routes_name.dart';
import 'package:six_to_eight/view/navigator/first_screen.dart';
import 'package:six_to_eight/view/navigator/second_screen.dart';
import 'package:six_to_eight/view/navigator/third_screen.dart';

Map<String, WidgetBuilder> appRoutes = {
  RoutesName.firstScreen: (context) => const FirstScreen(),
  RoutesName.secondScreen: (context) => const SecondScreen(),
  RoutesName.thirdScreen: (context) => const ThirdScreen(),
};
