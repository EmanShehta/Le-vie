import 'package:flutter/material.dart';

class emptycart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Row(
                children: [
                  Text(
                    'My Cart',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Raleway',
                      color: Colors.black,
                      fontSize: 28,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 80,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset('assets/Frame.png', fit: BoxFit.cover),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 10),
              child: Center(
                child: Text(
                  'Your Cart is empty',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Raleway',
                    color: Colors.black,
                    fontSize: 33,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40, top: 10),
              child: Center(
                child: Text(
                  'Sorry, the keyword you entered cannot be found, please check again or search with',
                  maxLines: 4,
                  style: TextStyle(
                    // fontWeight: FontWeight.bold,
                    fontFamily: 'Raleway',
                    color: Colors.grey,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 40,
              ),
              child: Center(
                child: Text(
                  'another keyword.',
                  maxLines: 4,
                  style: TextStyle(
                    // fontWeight: FontWeight.bold,
                    fontFamily: 'Raleway',
                    color: Colors.grey,
                    fontSize: 18,
                  ),
                ),
              ),
              //         another keyword
            ),
          ],
        ),
      ),
    );
  }
}
