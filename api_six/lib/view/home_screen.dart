import 'dart:convert';

import 'package:api_six/res/constant/constant.dart';
import 'package:api_six/utils/utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../model/character_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Dio dio = Dio();

  List<UserModel> userModelList = [];
  Utils utils = Utils();

  @override
  void initState() {
    // TODO: implement initState
    getUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
        actions: [
          IconButton(
            onPressed: () {
              // postApi();
              // putApi();
              deleteApi();
            },
            icon: const Icon(Icons.add_circle_outline_rounded),
          ),
        ],
      ),
      body: userModelList.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: userModelList.length,
              padding: const EdgeInsets.all(15),
              itemBuilder: (context, index) => ListTile(
                onTap: () {},
                title: Text(userModelList[index].name ?? ""),
                subtitle: Text(userModelList[index].email ?? ""),
                leading: Text(userModelList[index].id.toString()),
              ),
            ),
    );
  }

  getUserData() async {
    Response response;

    response = await dio.get(
      '${Constant.baseUrl}/users',
    );

    debugPrint("Response --> ${response.statusCode}");

    try {
      debugPrint(response.data.toString());
      userModelList = userModelFromJson(jsonEncode(response.data));
      setState(() {});
      debugPrint("userModelList -----> ${userModelList[0].name}");
    } on DioException catch (error) {
      debugPrint("error --> $error");
      // utils.showSnackBar(context, message: "${response.statusCode} ${response.statusMessage}");
    }
  }

  postApi() async {
    Response response;

    FormData formData = FormData.fromMap({
      "id": 12,
      "name": "Leanne",
      "username": "ABC",
      "email": "Leanne@april.biz",
      "address": {
        "street": "Kulas Light",
        "suite": "Apt. 556",
        "city": "Gwenborough",
        "zipcode": "92998-3874",
        "geo": {"lat": "-37.3159", "lng": "81.1496"}
      },
      "phone": "1-770-736-8031 x56442",
      "website": "hildegard.org",
      "company": {"name": "Romaguera-Crona", "catchPhrase": "Multi-layered client-server neural-net", "bs": "harness real-time e-markets"}
    });

    response = await dio.post(
      '${Constant.baseUrl}/users',
      data: formData,
    );

    debugPrint(response.data.toString());
    if (response.statusCode == 200) {
      // userModelList = userModelFromJson(jsonEncode(response.data));
      setState(() {});
    }
  }

  putApi() async {
    Response response;

    FormData formData = FormData.fromMap({
      "id": 9,
      "name": "qwer",
      "username": "dsfdsfgds",
      "email": "dfgdfgdfgdfg@april.biz",
      "address": {
        "street": "Kulas Light",
        "suite": "Apt. 556",
        "city": "Gwenborough",
        "zipcode": "92998-3874",
        "geo": {"lat": "-37.3159", "lng": "81.1496"}
      },
      "phone": "1-770-736-8031 x56442",
      "website": "hildegard.org",
      "company": {"name": "Romaguera-Crona", "catchPhrase": "Multi-layered client-server neural-net", "bs": "harness real-time e-markets"}
    });

    response = await dio.put(
      '${Constant.baseUrl}/users',
      data: formData,
    );

    debugPrint(response.data.toString());
    if (response.statusCode == 200) {
      // userModelList = userModelFromJson(jsonEncode(response.data));
      setState(() {});
    }
  }

  deleteApi() async {
    Response response;

    response = await dio.delete(
      '${Constant.baseUrl}/users',
      queryParameters: {
        "id": 2,
      },
    );

    debugPrint(response.data.toString());
    if (response.statusCode == 200) {
      userModelList.removeAt(1);
      setState(() {});
    }
  }
}
