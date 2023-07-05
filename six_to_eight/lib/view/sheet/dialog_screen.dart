import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DialogScreen extends StatefulWidget {
  const DialogScreen({Key? key}) : super(key: key);

  @override
  State<DialogScreen> createState() => _DialogScreenState();
}

class _DialogScreenState extends State<DialogScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dialog Screen"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => CupertinoAlertDialog(
                    title: const Text("title"),
                    // titlePadding: ,
                    // titleTextStyle: ,
                    content: const Text("You have complete the signup, Now you can login"),
                    // contentPadding: ,
                    // contentTextStyle: ,
                    actions: [
                      TextButton(
                        onPressed: () {},
                        child: const Text("Ok"),
                      ),
                      // TextButton(
                      //   onPressed: () {},
                      //   child: Text("Cancel"),
                      // ),
                    ],
                    // actionsAlignment: ,
                    // actionsOverflowAlignment: ,
                    // actionsOverflowButtonSpacing: ,
                    // actionsOverflowDirection: ,
                    // actionsPadding: ,
                    // insetPadding: EdgeInsets.zero,
                    // buttonPadding: ,
                    // iconPadding: ,
                  ),
                );
              },
              child: const Text("Open Dialog"),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                showSnackBar(context: context, message: "Hello");
              },
              child: const Text("Open Snack Bar"),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                showSnackBar(context: context, message: "How");
              },
              child: const Text("Open Snack Bar"),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                Fluttertoast.showToast(
                  msg: "This is Center Short Toast",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0,
                );
              },
              child: const Text("Open Toast Message"),
            ),
          ],
        ),
      ),
    );
  }
}

showSnackBar({BuildContext? context, String? message}) {
  return ScaffoldMessenger.of(context!).showSnackBar(
    SnackBar(
      content: Text(message!),
      // showCloseIcon: true,
      behavior: SnackBarBehavior.fixed,

      action: SnackBarAction(
        label: "Undo",
        onPressed: () {},
      ),
    ),
  );
}
