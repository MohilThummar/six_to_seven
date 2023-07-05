import 'package:flutter/material.dart';
import 'package:six_to_eight/view/navigator/second_screen.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("First Screen")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SecondScreen(
                  name: "Mohil",
                ),
              ),
            );

            // Navigator.pushNamed(context, RoutesName.secondScreen);
          },
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(Colors.black),
            backgroundColor: MaterialStateProperty.all(Colors.red),
          ),
          child: Text("Next Screen"),
        ),
      ),
    );
  }
}
