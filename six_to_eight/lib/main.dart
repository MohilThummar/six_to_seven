import 'package:flutter/material.dart';

import 'view/local_storage/local_storage_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        bottomSheetTheme: const BottomSheetThemeData(backgroundColor: Colors.transparent),
      ),
      // routes: appRoutes,
      // initialRoute: RoutesName.firstScreen,
      home: const LocalStorageScreen(),
    );
  }
}

/// Firebase (Auth, Firestore, Storage, StreamBuilder)
/// Api (RestApi, FutureBuilder)
/// GetX (Project Structure, Data management)
