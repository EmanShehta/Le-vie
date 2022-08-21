import 'package:flutter/material.dart';
import 'package:plants_application/Screens/logup.dart';
import 'package:plants_application/widgets/buttonStyle.dart';
import 'package:plants_application/widgets/textfilled.dart';

import 'login.dart';

class profilePage extends StatefulWidget {
  @override
  profilePageState createState() => profilePageState();
}

class profilePageState extends State<profilePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  void initState() {
    _tabController = new TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/background.jpg"), fit: BoxFit.fitHeight),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 160,
            ),
            TabBar(
              indicatorColor: Colors.green,
              unselectedLabelColor: Colors.black,
              labelColor: Colors.green,
              tabs: [
                Tab(
                  child: Text(
                    'Login',
                    style: TextStyle(
                      // color: Color(0xffa3afba),
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Raleway',
                      fontSize: 18,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      // color: Color(0xffa3afba),
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Raleway',
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
              controller: _tabController,
              indicatorSize: TabBarIndicatorSize.tab,
            ),
            Expanded(
              child: TabBarView(
                children: [LoginScreen(), logup()],
                controller: _tabController,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
