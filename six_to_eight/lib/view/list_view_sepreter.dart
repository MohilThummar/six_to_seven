import 'package:flutter/material.dart';

class ListViewSeparator extends StatefulWidget {
  const ListViewSeparator({Key? key}) : super(key: key);

  @override
  State<ListViewSeparator> createState() => _ListViewSeparatorState();
}

class _ListViewSeparatorState extends State<ListViewSeparator> {
  List<Map<String, dynamic>> listData = [
    {
      "name": 'jigar',
      "type": Icons.accessible_forward_sharp,
    },
    {
      "name": '514451469',
      "type": Icons.abc_rounded,
    },
    {
      "name": 'jigar',
      "type": Icons.accessible_forward_sharp,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List View Separator"),
      ),
      body: ListView.separated(
        itemCount: listData.length,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => SizedBox(width: 15),
        itemBuilder: (context, index) => Container(
          // height: 100,
          width: 100,
          color: Colors.red,
          child: Column(
            children: [Icon(listData[index]['type']), Text(listData[index]['name'])],
          ),
        ),
      ),
    );
  }
}
