import 'package:flutter/material.dart';
import 'package:la_vie/shared/components/components.dart';
import 'package:la_vie/shared/components/styles/colors.dart';
import 'package:la_vie/utils/size_extention.dart';

import '../layout_screen.dart';

class LeaveScreen extends StatelessWidget {
  const LeaveScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.black
        ),
        title: const Text('Blogs',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        )
        ),
      ),
      body: ListView.builder(
          itemBuilder: (context , index) => buildBlogItem(),
      itemCount: 3,
      ),
    );
  }
  Widget buildBlogItem() => Container(
    padding: EdgeInsets.all(10.rSp),
    margin: EdgeInsets.all(20.rSp),
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            offset: const Offset(10,4),
            color: Colors.grey.shade200,
            blurRadius: 10,
            spreadRadius: 5,
          )
        ]
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Flexible(
          child: ClipRRect(
            clipBehavior: Clip.hardEdge,
            child: Image.asset(
              'assets/images/samplePlant.png',
              width: 146.rSp,
              height: 133.rSp,
            ),
          ),
        ),
        SizedBox(
          width: 15.rw,
        ),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '2 days ago',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                  fontSize: 13,
                  color: defaultColor,
                ),
              ),
              SizedBox(height: 20.rh,),
              const Text(
                '5 Tips to treat plants',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 20.rh,
              ),
              Text(
                'leaf, in botany, any usually',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff7D7B7B).withOpacity(0.78,),
                ),
              ),
              SizedBox(
                height: 20.rh,
              ),
            ],
          ),
        ),
      ],
    ),
  );

}
