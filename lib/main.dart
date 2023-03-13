
import 'package:flutter/material.dart';
import 'package:circle_bottom_navigation_bar/circle_bottom_navigation_bar.dart';
import 'package:circle_bottom_navigation_bar/widgets/tab_data.dart';
void main() {
  runApp(MaterialApp(home: MyApp(),debugShowCheckedModeBanner: false,));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    int bottomNavIndex=0;

    int currentPage=1;
    return

    Scaffold(

      body:Container(

      ),
      bottomNavigationBar: CircleBottomNavigationBar(
      initialSelection: 1,
      circleColor: Colors.purple,
      activeIconColor: Colors.white,
      inactiveIconColor: Colors.grey,
      tabs: [
        TabData(
          icon: Icons.home,
          // Optional
          title: 'Home',// Optional
          fontSize: 12,// Optional
        ),
        TabData(icon: Icons.history),
        TabData(icon: Icons.search),
        TabData(icon: Icons.alarm),
      ],
      onTabChangedListener: (index) => setState(() => currentPage = index),
    )
    );
  }
}
