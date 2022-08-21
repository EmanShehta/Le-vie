import 'package:flutter/material.dart';
import 'package:plants_application/Screens/Product.dart';
import 'package:plants_application/Screens/detailOfProduct.dart';
import 'package:plants_application/Screens/login.dart';
import 'package:plants_application/Screens/logup.dart';
import 'package:plants_application/Screens/scanner.dart';
import 'package:plants_application/widgets/cartPlanet.dart';
import 'package:plants_application/widgets/cart2.dart';

import 'package:qrscan/qrscan.dart';

class home extends StatefulWidget {
  @override
  State<home> createState() => _homeState();
}

@override
class _homeState extends State<home> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  void initState() {
    _tabController = new TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/home.jpg"), fit: BoxFit.fitHeight),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.only(top: 80, right: 20, left: 20, bottom: 20),
          child: Column(
            children: [
              Row(
                //  crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 11,
                    child: Container(
                      width: 50,
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.grey[300]),
                      child: Row(
                        children: [
                          Icon(
                            Icons.search,
                          ),
                          SizedBox(
                            width: 15.0,
                          ),
                          new Expanded(
                            child: TextField(
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Search ",
                                hintStyle: TextStyle(color: Colors.grey),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 8),
                                isDense: true,
                              ),
                              cursorColor: Color.fromRGBO(26, 170, 75, 0.8),
                              // cursorHeight: 2,
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                      width: 50,
                      height: 52,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(26, 170, 75, 0.8),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(Icons.shopping_cart_outlined))
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                color: Colors.white,
                //padding: EdgeInsets.only(top: 60)
                child: TabBar(
                  indicatorColor: Colors.green,
                  unselectedLabelColor: Colors.black,
                  labelColor: Colors.green,
                  tabs: [
                    Tab(
                      child: Container(
                        child: Text(
                          'All',
                          style: TextStyle(
                            // color: Color(0xffa3afba),
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Raleway',
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Plants',
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
                        'Seeds',
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
                        'Tools',
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
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(child: cart1()),
                  Expanded(child: cart2()),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [details(), details(), details(), details()],
                  controller: _tabController,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
