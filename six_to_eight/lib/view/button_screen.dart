import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ButtonScreen extends StatefulWidget {
  const ButtonScreen({Key? key}) : super(key: key);

  @override
  State<ButtonScreen> createState() => _ButtonScreenState();
}

class _ButtonScreenState extends State<ButtonScreen> {
  bool switchValue = false;

  String dropDownData = "Hello 3";
  List dropDownList = [
    {
      "value": "Hello 1",
      "data": "Hello One",
    },
    {
      "value": "Hello 2",
      "data": "Hello Two",
    },
    {
      "value": "Hello 3",
      "data": "Hello Three",
    },
    {
      "value": "Hello 4",
      "data": "Hello Four",
    },
    {
      "value": "Hello 5",
      "data": "Hello Five",
    },
  ];

  bool radioData = true;

  // Initial radio list tile Value
  int radioListData = 1;
  List<int> radioListItems = [1, 2, 3, 4, 5, 6, 7, 8];

  @override
  Widget build(BuildContext context) {
    debugPrint("build ---------------->> ");
    return Scaffold(
      appBar: AppBar(title: const Text("Button Screen")),
      body: ListView(
        children: [
          const SizedBox(height: 15),
          const BackButton(),
          const SizedBox(height: 15),
          const CloseButton(),
          const SizedBox(height: 15),
          ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.black),
              backgroundColor: MaterialStateProperty.all(Colors.red),
            ),
            child: const Text("Next Screen"),
          ),
          const SizedBox(height: 15),
          GestureDetector(
            onTap: () {
              debugPrint("onTap --> ");
            },
            onLongPress: () {
              debugPrint("onLongPress --> ");
            },
            child: Container(
              height: 100,
              width: 100,
              color: Colors.red,
            ),
          ),
          const SizedBox(height: 15),
          InkWell(
            onTap: () {
              debugPrint("onTap --> ");
            },
            child: Container(
              height: 30,
              width: 30,
              child: const Icon(Icons.add),
            ),
          ),
          const SizedBox(height: 15),
          IconButton(
            onPressed: () {},
            color: Colors.red,
            hoverColor: Colors.yellow,
            splashColor: Colors.pink,
            splashRadius: 40,
            icon: const Icon(Icons.navigate_next),
          ),
          const SizedBox(height: 15),
          OutlinedButton(
            onPressed: () {
              print("onTap --> OutlinedButton");
            },
            autofocus: true,
            child: const Text("Hello!"),
          ),
          const SizedBox(height: 15),
          TextButton(
            onPressed: () {},
            child: const Text("Login!"),
          ),
          const SizedBox(height: 15),
          RichText(
            text: TextSpan(
              children: <TextSpan>[
                const TextSpan(
                  text: 'By clicking Sign Up, you agree to our ',
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
                TextSpan(
                  text: 'Terms of Service',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      print('Terms of Service"');
                    },
                ),
                const TextSpan(
                  text: ' and that you have read our ',
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
                TextSpan(
                  text: 'Privacy Policy',
                  style: TextStyle(
                    color: Colors.green,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      print('Privacy Policy"');
                    },
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          Switch(
            value: switchValue,
            inactiveThumbColor: Colors.red,
            activeColor: Colors.yellow,
            inactiveTrackColor: Colors.black,
            activeTrackColor: Colors.green,
            onChanged: (value) {
              debugPrint("Value --->> $value");
              switchValue = value;
              setState(() {});
            },
          ),
          const SizedBox(height: 15),
          CupertinoSwitch(
            value: switchValue,
            // activeColor: Colors.yellow,
            onChanged: (value) {
              debugPrint("Value --->> $value");
              switchValue = value;
              setState(() {});
            },
          ),
          const SizedBox(height: 15),
          Transform.scale(
            scale: 2,
            child: Checkbox(
              value: switchValue,
              checkColor: Colors.red,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
              onChanged: (value) {
                debugPrint("Value --->> $value");
                switchValue = value!;
                setState(() {});
              },
            ),
          ),
          const SizedBox(height: 15),
          DropdownButton(
            value: dropDownData,
            isExpanded: true,
            items: dropDownList
                .map((value) => DropdownMenuItem(
                      value: value['value'],
                      child: Text(value['data']),
                    ))
                .toList(),

            onChanged: (value) {
              debugPrint(value.toString());
              dropDownData = value.toString();
              setState(() {});
            },
          ),
          const SizedBox(height: 15),
          PopupMenuButton(
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 1,
                child: Row(
                  children: const [Icon(Icons.star), SizedBox(width: 10), Text("Get The App")],
                ),
              ),
              PopupMenuItem(
                value: 65,
                child: Row(
                  children: const [Icon(Icons.chrome_reader_mode), SizedBox(width: 10), Text("About")],
                ),
              ),
            ],
            offset: Offset(0, 100),
            color: Colors.grey,
            elevation: 2,
            onSelected: (value) {
              debugPrint(value.toString());
            },
          ),
          const SizedBox(height: 15),
          Radio(
            value: radioData,
            groupValue: false,
            onChanged: (value) {
              debugPrint("Value --->> $value");
              radioData = false;
              setState(() {});
            },
          ),
          Radio(
            value: radioData,
            groupValue: true,
            onChanged: (value) {
              debugPrint("Value --->> $value");
              radioData = true;
              setState(() {});
            },
          ),
          const SizedBox(height: 15),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: radioListItems.length,
            itemBuilder: (context, index) {
              return RadioListTile(
                value: radioListItems[index],
                groupValue: radioListData,
                onChanged: (value) {
                  debugPrint("value  --> $value");
                  radioListData = value!;
                  setState(() {});
                },
                title: Text("Number ${radioListItems[index]}"),
              );
            },
          ),
          const SizedBox(height: 120),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint("FloatingActionButton --------------------->>> ");
        },
        tooltip: "12354",
        mini: false,
        splashColor: Colors.purple,
        hoverColor: Colors.yellow,
        child: const Icon(Icons.add),
      ),
    );
  }
}
