import 'package:flutter/material.dart';
import 'package:plants_application/Screens/tapbar.dart';

class splach extends StatefulWidget {
  @override
  _splachState createState() => _splachState();
}

class _splachState extends State<splach> {
  @override
  void initState() {
    super.initState();
    _naviagatohome();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          child: Image(
            image: AssetImage(
              'assets/LaVie.png',
            ),
            // fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }

  void _naviagatohome() async {
    await Future.delayed(Duration(seconds: 1), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => profilePage()));
  }
}
