import 'package:flutter/material.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({Key? key}) : super(key: key);

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  int currentIndex = 0;

  List<Widget> listOfScreen = [
    Container(color: Colors.red),
    Container(color: Colors.yellow),
    Container(color: Colors.blue),
    Container(color: Colors.pink),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Bottom Bar screen")),
      body: listOfScreen[currentIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomSheet: BottomAppBar(
        color: Colors.blue,
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.transparent,

          showSelectedLabels: false,
          showUnselectedLabels: false,

          unselectedLabelStyle: TextStyle(),
          selectedLabelStyle: TextStyle(),
          // selectedFontSize: ,
          // unselectedFontSize: ,
          //
          //
          // unselectedIconTheme: ,
          // selectedIconTheme: ,

          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.white,

          elevation: 0,

          landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
          onTap: (value) {
            debugPrint("Value --->> $value");
            currentIndex = value;
            setState(() {});
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
              backgroundColor: Colors.red,
              activeIcon: Icon(Icons.home_outlined),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: "Search",
              backgroundColor: Colors.yellow,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: "Notification",
              backgroundColor: Colors.blue,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: "Account",
              backgroundColor: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}
