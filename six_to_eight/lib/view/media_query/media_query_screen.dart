import 'package:flutter/material.dart';

class MediaQueryScreen extends StatefulWidget {
  const MediaQueryScreen({Key? key}) : super(key: key);

  @override
  State<MediaQueryScreen> createState() => _MediaQueryScreenState();
}

class _MediaQueryScreenState extends State<MediaQueryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Media Query Screen"),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
