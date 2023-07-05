import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  /// ----- Show SnackBar ------- >>>
  void showSnackBar(
    BuildContext context, {
    String? message,
    String? label,
    void Function()? onPressed,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message ?? ""),
        backgroundColor: (Colors.black),
        behavior: SnackBarBehavior.floating,
        action: SnackBarAction(label: label ?? "", onPressed: onPressed ?? () {}),
      ),
    );
  }

  /// ----- Show Toast Message ------- >>>
  void showToastMessage({
    String? message,
  }) {
    Fluttertoast.showToast(
      msg: message ?? "",
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.black38,
      textColor: Colors.white,
    );
  }
}
