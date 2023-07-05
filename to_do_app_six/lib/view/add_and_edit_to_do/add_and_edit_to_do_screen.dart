import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do_app_six/res/common/app_text_field.dart';
import 'package:to_do_app_six/res/constant/app_strings.dart';

import '../../model/to_do_model.dart';

class AddAndEditToDoScreen extends StatefulWidget {
  final ToDoModel? toDoModel;
  final int? index;
  const AddAndEditToDoScreen({Key? key, this.toDoModel, this.index}) : super(key: key);

  @override
  State<AddAndEditToDoScreen> createState() => _AddAndEditToDoScreenState();
}

class _AddAndEditToDoScreenState extends State<AddAndEditToDoScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  String time = "";

  SharedPreferences? sharedPreferences;

  List<String> toDoList = [];

  setInstant() async {
    sharedPreferences = await SharedPreferences.getInstance();
    getData();
  }

  getData() {
    if (sharedPreferences!.containsKey("ToDoData")) {
      toDoList = sharedPreferences!.getStringList("ToDoData")!;
      setState(() {});
    } else {
      debugPrint("No data found -->");
    }
  }

  setData() {
    Map<String, dynamic> data = {
      "title": titleController.text,
      "description": descriptionController.text,
      "time": time,
    };

    if (widget.toDoModel != null) {
      toDoList[widget.index!] = (jsonEncode(data));
    } else {
      toDoList.add(jsonEncode(data));
    }

    sharedPreferences!.setStringList("ToDoData", toDoList);
    Navigator.pop(context);
  }

  @override
  void initState() {
    // TODO: implement initState
    setInstant();

    if (widget.toDoModel != null) {
      titleController.text = widget.toDoModel!.title!;
      descriptionController.text = widget.toDoModel!.description!;
      time = widget.toDoModel!.time!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.addAndEditScreen),
      ),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          AppTextField(
            controller: titleController,
            hintText: AppStrings.enterTitle,
          ),
          const SizedBox(height: 15),
          AppTextField(
            controller: descriptionController,
            hintText: AppStrings.enterDescription,
            minAndMaxLine: 6,
          ),
          const SizedBox(height: 15),
          GestureDetector(
            onTap: () async {
              TimeOfDay? selectTime = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              );

              if (selectTime != null) {
                debugPrint(selectTime.format(context));
                time = selectTime.format(context);
                setState(() {});
              }
            },
            child: Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.grey.shade500,
                ),
              ),
              child: Text(
                time.isNotEmpty ? time : AppStrings.selectTime,
                style: TextStyle(
                  color: time.isNotEmpty ? Colors.black : Colors.grey.shade700,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              setData();
            },
            child: const Text(AppStrings.addTodo),
          ),
        ],
      ),
    );
  }
}
