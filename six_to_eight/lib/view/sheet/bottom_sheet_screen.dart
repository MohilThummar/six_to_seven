import 'package:flutter/material.dart';

class BottomSheetScreen extends StatefulWidget {
  const BottomSheetScreen({Key? key}) : super(key: key);

  @override
  State<BottomSheetScreen> createState() => _BottomSheetScreenState();
}

class _BottomSheetScreenState extends State<BottomSheetScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bottom Sheet"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  elevation: 0,
                  // barrierColor: Colors.transparent,
                  // backgroundColor: Colors.green,
                  isScrollControlled: true,
                  isDismissible: false,
                  enableDrag: false,
                  builder: (context) => Container(
                    height: 700,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                    child: CloseButton(),
                  ),
                );
              },
              child: const Text("Open Bottom Sheet"),
            ),
          ],
        ),
      ),
    );
  }
}
