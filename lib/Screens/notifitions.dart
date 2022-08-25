import 'package:flutter/material.dart';

class notify extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Column(
          children: [
            Center(
              child: Text(
                'Notification',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 15,
                    top: 10,
                  ),
                  child: Image.asset("assets/iconnotify.png"),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Joy Arnold left 6 comments on Your Post',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 15),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 100,
              ),
              child: Text(
                'Yesterday at 11:42 PM',
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    fontSize: 15),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Image.asset("assets/line.png"),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 15,
                    top: 10,
                  ),
                  child: Image.asset("assets/iconnotify2.png"),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  //  padding: const EdgeInsets.only(right: 30),
                  child: Text(
                    'Dennis Nedry commented on Isla Nublar SOC2 compliance report ',
                    maxLines: 3,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 15),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 60,
                    top: 10,
                  ),
                  child: Image.asset("assets/rect.png"),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  //  padding: const EdgeInsets.only(right: 30),
                  child: Text(
                    '“ leaves are an integral part of the stem system.    They are attached by a continuous vascular system to the rest of the plant so that free exchange of nutrients.”',
                    maxLines: 3,
                    style: TextStyle(
                        height: 1.7,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 14),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 100,
              ),
              child: Text(
                'Yesterday at 11:42 PM',
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    fontSize: 15),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Image.asset("assets/line.png"),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 15,
                    top: 10,
                  ),
                  child: Image.asset("assets/iconnotify3.png"),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  //  padding: const EdgeInsets.only(right: 30),
                  child: Text(
                    'John Hammond created Isla Nublar SOC2 compliance report  ',
                    maxLines: 3,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 15),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Image.asset("assets/line.png"),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 15,
                    top: 10,
                  ),
                  child: Image.asset("assets/iconnotify.png"),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Joy Arnold left 6 comments on Your Post',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 15),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 100,
              ),
              child: Text(
                'Yesterday at 11:42 PM',
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    fontSize: 15),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Image.asset("assets/line.png"),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 15,
                    top: 10,
                  ),
                  child: Image.asset("assets/iconnotify2.png"),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  //  padding: const EdgeInsets.only(right: 30),
                  child: Text(
                    'Dennis Nedry commented on Isla Nublar SOC2 compliance report ',
                    maxLines: 3,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 15),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 60,
                    top: 10,
                  ),
                  child: Image.asset("assets/rect.png"),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  //  padding: const EdgeInsets.only(right: 30),
                  child: Text(
                    '“ leaves are an integral part of the stem system.    They are attached by a continuous vascular system to the rest of the plant so that free exchange of nutrients.”',
                    maxLines: 3,
                    style: TextStyle(
                        height: 1.7,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 14),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 100,
              ),
              child: Text(
                'Yesterday at 11:42 PM',
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    fontSize: 15),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Image.asset("assets/line.png"),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 15,
                    top: 10,
                  ),
                  child: Image.asset("assets/iconnotify3.png"),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  //  padding: const EdgeInsets.only(right: 30),
                  child: Text(
                    'John Hammond created Isla Nublar SOC2 compliance report  ',
                    maxLines: 3,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 15),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
