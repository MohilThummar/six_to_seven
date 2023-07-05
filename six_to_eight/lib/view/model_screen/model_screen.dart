import 'package:flutter/material.dart';
import 'package:six_to_eight/data/user_data.dart';
import 'package:six_to_eight/model/user_model.dart';

class ModelScreen extends StatefulWidget {
  const ModelScreen({Key? key}) : super(key: key);

  @override
  State<ModelScreen> createState() => _ModelScreenState();
}

class _ModelScreenState extends State<ModelScreen> {
  UserModel? userModel = UserModel.fromJson(userData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Model Screen"),
      ),
      body: Column(
        children: [
          Text("Sir Name --> ${userModel!.sirName!}"),
          Expanded(
            child: ListView.builder(
              itemCount: userModel!.studentList!.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(userModel!.studentList![index].name!),
                subtitle: Text(userModel!.studentList![index].education!),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
