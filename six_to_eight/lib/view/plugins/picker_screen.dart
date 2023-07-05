import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PickerScreen extends StatefulWidget {
  const PickerScreen({Key? key}) : super(key: key);

  @override
  State<PickerScreen> createState() => _PickerScreenState();
}

class _PickerScreenState extends State<PickerScreen> {
  final ImagePicker picker = ImagePicker();
  XFile? pickImage;

  File? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Image Picker"),
      ),
      body: Column(
        children: [
          if (image != null) Image.file(image!),
          ElevatedButton(
            onPressed: () async {
              pickImage = await picker.pickImage(source: ImageSource.camera);

              debugPrint("Pick image -------->> ${pickImage!.path}");
              debugPrint("Pick image name -------->> ${pickImage!.name}");

              image = File(pickImage!.path);

              setState(() {});
            },
            child: const Text("Pick Image"),
          ),
        ],
      ),
    );
  }
}
