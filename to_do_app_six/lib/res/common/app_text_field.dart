import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final int? minAndMaxLine;

  const AppTextField({Key? key, this.controller, this.hintText, this.minAndMaxLine}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      minLines: minAndMaxLine,
      maxLines: minAndMaxLine,
      decoration: InputDecoration(
        hintText: hintText ?? "",
        contentPadding: EdgeInsets.all(14),
        isDense: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
