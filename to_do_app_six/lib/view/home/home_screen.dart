import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do_app_six/model/to_do_model.dart';
import 'package:to_do_app_six/res/constant/app_strings.dart';
import 'package:to_do_app_six/view/add_and_edit_to_do/add_and_edit_to_do_screen.dart';
import 'package:to_do_app_six/view/home/component/to_do_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  SharedPreferences? sharedPreferences;

  List<ToDoModel> toDoModel = [];

  setInstant() async {
    sharedPreferences = await SharedPreferences.getInstance();
    getData();
  }

  getData() {
    toDoModel = [];
    if (sharedPreferences!.containsKey("ToDoData")) {
      var data = sharedPreferences!.getStringList("ToDoData");

      for (var mapData in data!) {
        toDoModel.add(toDoModelFromJson(mapData));
      }

      debugPrint(data.toString());
      debugPrint(jsonEncode(toDoModel));
      setState(() {});
    } else {
      debugPrint("No data found -->");
    }
  }

  setData() {
    List<String> listData = [];
    for (var mapData in toDoModel) {
      listData.add(jsonEncode(mapData));
    }

    sharedPreferences!.setStringList("ToDoData", listData);
  }

  @override
  void initState() {
    // TODO: implement initState
    setInstant();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.homeScreen),
      ),
      body: toDoModel.isEmpty
          ? const Center(
              child: Text(
                "No data found",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
            )
          : ListView.separated(
              itemCount: toDoModel.length,
              padding: const EdgeInsets.all(15).copyWith(bottom: 90),
              physics: const BouncingScrollPhysics(),
              separatorBuilder: (context, index) => const SizedBox(height: 15),
              itemBuilder: (context, index) {
                return ToDoTile(
                  title: toDoModel[index].title,
                  time: toDoModel[index].time,
                  description: toDoModel[index].description,
                  count: (index + 1).toString(),
                  onEdit: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddAndEditToDoScreen(
                          toDoModel: toDoModel[index],
                          index: index,
                        ),
                      ),
                    ).then((value) {
                      getData();
                    });
                  },
                  onDelete: () {
                    toDoModel.removeAt(index);
                    setState(() {});
                    setData();
                  },
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddAndEditToDoScreen(),
            ),
          ).then((value) {
            getData();
          });
        },
        child: const Icon(Icons.navigate_next),
      ),
    );
  }
}
