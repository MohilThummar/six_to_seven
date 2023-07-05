import 'package:flutter/material.dart';

class GridViewScreen extends StatefulWidget {
  const GridViewScreen({Key? key}) : super(key: key);

  @override
  State<GridViewScreen> createState() => _GridViewScreenState();
}

class _GridViewScreenState extends State<GridViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Grid View Screen")),
      body: GridView(
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.all(15),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          // crossAxisCount: 3,
          maxCrossAxisExtent: 60,
          crossAxisSpacing: 15,
          mainAxisSpacing: 20,
          mainAxisExtent: 100,
          // childAspectRatio: 2,
        ),
        children: [
          Container(color: Colors.red),
          Container(color: Colors.yellow),
          Container(color: Colors.blue),
          Container(color: Colors.black),
          Container(color: Colors.deepOrange),
          Container(color: Colors.amber),
          Container(color: Colors.deepPurple),
        ],
      ),
    );
  }
}
