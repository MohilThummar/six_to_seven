import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:six_to_eight/res/constant/constant.dart';

class LocalStorageScreen extends StatefulWidget {
  const LocalStorageScreen({Key? key}) : super(key: key);

  @override
  State<LocalStorageScreen> createState() => _LocalStorageScreenState();
}

class _LocalStorageScreenState extends State<LocalStorageScreen> {
  SharedPreferences? prefs;

  int count = 0;
  bool repeat = true;
  double decimal = 1.0;
  String action = "";
  List<String> items = [];
  String mapEncodeData = "";
  Map<String, dynamic> mapDecodeData = {};

  createInstant() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  void initState() {
    // TODO: implement initState
    createInstant();
    super.initState();
  }

  setData() async {
    await prefs!.setInt(Constant.counter, 20);
    await prefs!.setBool(Constant.repeat, true);
    await prefs!.setDouble(Constant.decimal, 1.5);
    await prefs!.setString(Constant.action, 'Start');
    await prefs!.setStringList(Constant.items, <String>['Earth', 'Moon', 'Sun']);
    await prefs!.setString(
      Constant.mapData,
      jsonEncode({
        "name": "Mohil Thummar",
        "age": "21",
        "number": "8140843697",
        "email": "mohil.skillqode@gmail.com",
      }),
    );

    debugPrint("Data is set -->");
  }

  getData() {
    count = prefs!.getInt(Constant.counter)!;
    repeat = prefs!.getBool(Constant.repeat)!;
    decimal = prefs!.getDouble(Constant.decimal)!;
    action = prefs!.getString(Constant.action)!;
    items = prefs!.getStringList(Constant.items)!;

    mapEncodeData = prefs!.getString(Constant.mapData)!;

    mapDecodeData = jsonDecode(mapEncodeData);

    setState(() {});

    debugPrint("count is get --> $count");
    debugPrint("repeat is get --> $repeat");
    debugPrint("decimal is get --> $decimal");
    debugPrint("action is get --> $action");
    debugPrint("items is get --> $items");
    debugPrint("mapDecodeData is get --> $mapDecodeData");
    debugPrint("mapEncodeData is get --> $mapEncodeData");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Local Storage Screen"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: setData,
              child: const Text("Set Data"),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: getData,
              child: const Text("Get Data"),
            ),
            const SizedBox(height: 15),
            Text(
              "Count: $count\nMap Data: $mapDecodeData",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
