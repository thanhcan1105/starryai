import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/home_controller.dart';
import '../explore/explore_screen.dart';
import '../home/home_screen.dart';
import '../my_creations/my_creations_screen.dart';

class BottomMenu extends GetView<HomeController> {
  const BottomMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return const BottomMenuScreen();
  }
}

class BottomMenuScreen extends StatefulWidget {
  const BottomMenuScreen({super.key});

  @override
  State<BottomMenuScreen> createState() => _BottomMenuScreenState();
}

class _BottomMenuScreenState extends State<BottomMenuScreen> {
  List<Widget> listWidget = [
    const HomeScreen(),
    MyCreationsScreen(),
    const ExploreScreen(),
  ];
  int indexSelected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: listWidget.elementAt(indexSelected),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.image),
            label: 'My Createtions',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Explore',
          ),
        ],
        currentIndex: indexSelected,
        onTap: (value) {
          indexSelected = value;
          setState(() {});
        },
        // selectedFontSize: 15,
        selectedIconTheme: const IconThemeData(
          color: Colors.amberAccent,
          size: 30,
        ),
        selectedItemColor: Colors.amberAccent,
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
        mouseCursor: SystemMouseCursors.grab,
      ),
    );
  }
}
