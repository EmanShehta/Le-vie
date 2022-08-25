import 'package:flutter/material.dart';
import 'package:plants_application/Screens/home.dart';
import 'package:plants_application/Screens/notifitions.dart';
import 'package:plants_application/Screens/planetscreen.dart';
import 'package:plants_application/Screens/profile.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:plants_application/Screens/scanner.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final items = [
    Image.asset('assets/icon2.png'),
    Image.asset('assets/icon3.png'),
    Icon(Icons.house_sharp),
    Image.asset('assets/icon1.png'),
    Image.asset('assets/icon5.png')
  ];

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: CurvedNavigationBar(
        items: items,
        index: index,

        onTap: (selctedIndex) {
          setState(() {
            index = selctedIndex;
          });
        },
        height: 60,
        //color: Color.fromRGBO(26, 170, 75, 0.8),

        backgroundColor: Colors.white10,
        animationDuration: const Duration(milliseconds: 300),
        buttonBackgroundColor: Color.fromRGBO(26, 170, 75, 0.8),
        // animationCurve: ,
      ),
      body: Container(child: getSelectedWidget(index: index)),
    );
  }

  Widget getSelectedWidget({required int index}) {
    Widget widget = home();
    switch (index) {
      case 0:
        widget = Plants();
        break;
      case 1:
        widget = scan();
        break;
      case 2:
        widget = home();
        break;
      case 3:
        widget = notify();
        break;
      case 4:
        widget = profilepic();
        break;
      //defult
    }
    return widget;
  }
}
