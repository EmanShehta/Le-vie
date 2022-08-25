import 'package:flutter/material.dart';

import 'cartbuy.dart';

class cart1 extends StatefulWidget {
  @override
  State<cart1> createState() => _cart1State();
}

class _cart1State extends State<cart1> {
  int price = 1;
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.only(
            top: 40,
            start: 5,
          ),
          child: Card(
            elevation: 7,
            child: Container(
              child: Padding(
                padding: const EdgeInsetsDirectional.only(
                  start: 10,
                  end: 7,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 140,
                      height: 110,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'GARDENIA PLANT',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '70 EGP',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(
                        start: 10,
                        end: 20,
                        bottom: 15,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(30)),
                        child: MaterialButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CartPage()),
                            );
                          },
                          child: Text(
                            'Add To Cart',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 80, top: 70, bottom: 140),
          child: Row(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 25,
                height: 25,
                child: FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      price--;
                    });
                  },
                  mini: true,
                  backgroundColor: Color.fromRGBO(227, 227, 227, 0.9),
                  elevation: 3,
                  child: Icon(
                    Icons.remove,
                    size: 20,
                  ),
                  shape: RoundedRectangleBorder(),
                ),
              ),
              SizedBox(
                width: 3,
              ),
              Text(
                '${price}',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(
                width: 3,
              ),
              Container(
                width: 25,
                height: 25,
                child: FloatingActionButton(
                  backgroundColor: Color.fromRGBO(227, 227, 227, 0.9),
                  elevation: 3,
                  onPressed: () {
                    setState(() {
                      price++;
                    });
                  },
                  heroTag: 'age+',
                  mini: true,
                  child: Icon(
                    Icons.add,
                    size: 20,
                  ),
                  shape: RoundedRectangleBorder(),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Positioned(
          child: Image.asset(
            'assets/p1.png',
            fit: BoxFit.cover,
          ),
          top: 15,
          left: 2,
        ),
      ],
    );
  }
}
