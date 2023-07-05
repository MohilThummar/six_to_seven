import 'package:app_structure_six/res/constant/app_colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.redColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: MediaQuery.of(context).padding.top),
            Text("Padding Top ${MediaQuery.of(context).padding.top}"),
            Text("Padding Bottom ${MediaQuery.of(context).padding.bottom}"),
            Text("Width  --> ${MediaQuery.of(context).size.width}"),
            Container(
              height: height / 12,
              width: MediaQuery.of(context).size.height / 12,
              color: AppColors.yellowColor,
            ),
            MediaQuery.of(context).size.width > 600
                ? Container(
                    height: MediaQuery.of(context).size.height / 12,
                    width: MediaQuery.of(context).size.height / 12,
                    color: AppColors.redColor,
                  )
                : SizedBox(),
            // if (Platform.isAndroid)
            //   Container(
            //     height: MediaQuery.of(context).size.height / 12,
            //     width: MediaQuery.of(context).size.height / 12,
            //     color: AppColors.yellowColor,
            //   )
          ],
        ),
      ),
    );
  }
}
