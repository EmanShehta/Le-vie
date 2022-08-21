import 'package:flutter/material.dart';

import 'Screens/splach.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: splach(),
      theme: ThemeData(
          // primarySwatch: Colors.pink,
          ),
    );
  }
}
