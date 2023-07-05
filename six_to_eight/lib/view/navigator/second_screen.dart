import 'package:flutter/material.dart';
import 'package:six_to_eight/routes/routes_name.dart';

class SecondScreen extends StatefulWidget {
  final String? name;
  const SecondScreen({Key? key, this.name}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Second Screen ${widget.name}")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Navigator.pushAndRemoveUntil(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => const ThirdScreen(),
                //   ),
                //   (route) => false,
                // );
                // Navigator.pushReplacement(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => const ThirdScreen(),
                //   ),
                // );
                Navigator.pushReplacementNamed(context, RoutesName.thirdScreen);
              },
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.black),
                backgroundColor: MaterialStateProperty.all(Colors.red),
              ),
              child: const Text("Next Screen"),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.black),
                backgroundColor: MaterialStateProperty.all(Colors.red),
              ),
              child: const Text("Back Screen"),
            ),
          ],
        ),
      ),
    );
  }
}
