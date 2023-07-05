import 'package:flutter/material.dart';

class TextFiledScreen extends StatefulWidget {
  const TextFiledScreen({Key? key}) : super(key: key);

  @override
  State<TextFiledScreen> createState() => _TextFiledScreenState();
}

class _TextFiledScreenState extends State<TextFiledScreen> {
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TextFiled Screen"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              style: const TextStyle(color: Colors.red),
              autofocus: true,
              textDirection: TextDirection.ltr,
              textAlign: TextAlign.start,
              maxLines: 1,
              minLines: 1,
              textAlignVertical: TextAlignVertical.center,
              obscureText: true,
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.name,
              textCapitalization: TextCapitalization.words,
              // cursorWidth: 10,
              cursorColor: Colors.red,
              // cursorHeight: 12,
              enabled: true,
              autocorrect: false,
              enableSuggestions: false,
              maxLength: 10,
              decoration: InputDecoration(
                hintText: "Email",
                hintStyle: const TextStyle(),
                // hintMaxLines: ,
                // hintTextDirection: ,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                // border: InputBorder.none,
                // enabledBorder: OutlineInputBorder(
                //   borderRadius: BorderRadius.circular(12),
                //   borderSide: BorderSide(color: Colors.red),
                // ),
                // disabledBorder: OutlineInputBorder(
                //   borderRadius: BorderRadius.circular(12),
                //   borderSide: BorderSide(color: Colors.green),
                // ),
                // focusedBorder: OutlineInputBorder(
                //   borderRadius: BorderRadius.circular(12),
                //   borderSide: BorderSide(color: Colors.black),
                // ),
                // errorBorder: ,
                // focusedErrorBorder: ,
                labelText: "Email",
                // labelStyle: ,
                // label: ,
                // contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                // isDense: true,
                // counter: Container(),
                // prefix: Icon(Icons.email),
                prefixIcon: const Icon(Icons.email),
                // prefixIconColor: Colors.yellow,
                prefixText: "\$",
                // prefixStyle: ,
                // prefixIconConstraints: BoxConstraints.tight(Size(50, 15)),
                suffix: const Icon(Icons.password),
                suffixIcon: const Icon(Icons.password),
                // suffixIconColor: ,
                // suffixText: ,
                // suffixStyle: ,
                // suffixIconConstraints: ,
                // alignLabelWithHint: false,
              ),
              onSubmitted: (value) {
                debugPrint("onSubmitted --> $value");
              },
              onChanged: (value) {
                debugPrint(value);
              },
              onTap: () {
                debugPrint("On Tap --> ");
              },
              obscuringCharacter: "*",
            ),
            const SizedBox(height: 15),
            Text(emailController.text)
          ],
        ),
      ),
    );
  }
}
