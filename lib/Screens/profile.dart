import 'dart:ui';

import 'package:flutter/material.dart';

class profilepic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      // overflow: Overflow.visible,
      alignment: AlignmentDirectional.topCenter,
      fit: StackFit.passthrough,
      children: <Widget>[
        SizedBox(
          height: 400,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset('assets/girl.png', fit: BoxFit.cover),
              ClipRRect(
                // Clip it cleanly.
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    color: Colors.black.withOpacity(0.7),
                    alignment: Alignment.center,
                    //child: Text('CHOCOLATE'),
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 150,
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 80,
            child: Image.asset('assets/photo.png'),
          ),
        ),
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 350),
              child: Container(
                  width: double.infinity,
                  height: 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    //border: Border.all(color: Colors.white, width: 3.0)
                  ),
                  child: Container(
                    decoration: new BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      color: Colors.white,
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 380, left: 20, right: 20),
              child: Container(
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(243, 254, 245, 1),
                  borderRadius: BorderRadius.circular(25.0),
                  // color: Colors.white,
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Image.asset('assets/stars.png'),
                    SizedBox(
                      width: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Text(
                        'You have 30 Points',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                    //  decoration: ,
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, top: 495),
              child: Text(
                'Edit Profile',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Raleway',
                  fontSize: 18,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 530, left: 20, right: 20),
              child: Container(
                width: double.infinity,
                height: 80,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(243, 254, 245, 1),
                  borderRadius: BorderRadius.circular(25.0),
                  border: Border.all(
                    width: 0.5,
                    // assign the color to the border color
                    color: Colors.grey,
                  ),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Image.asset('assets/icon.png'),
                    SizedBox(
                      width: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: Text(
                        'Change name',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Icon(
                      Icons.arrow_forward_rounded,
                      // color: Colors.black,
                    ),
                    //  decoration: ,
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 630, left: 20, right: 20),
              child: Container(
                width: double.infinity,
                height: 80,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(243, 254, 245, 1),
                  borderRadius: BorderRadius.circular(25.0),
                  border: Border.all(
                    width: 0.5,
                    // assign the color to the border color
                    color: Colors.grey,
                  ),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Image.asset('assets/icon.png'),
                    SizedBox(
                      width: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: Text(
                        'Change Email',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Icon(
                      Icons.arrow_forward_rounded,
                      // color: Colors.black,
                    ),
                    //  decoration: ,
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
