import 'package:flutter/material.dart';
import 'package:plants_application/Screens/Tips.dart';
import 'package:plants_application/Screens/quiz.dart';
import 'package:plants_application/widgets/CustomTextStyle.dart';

class Plants extends StatefulWidget {
  @override
  _PlantsState createState() => _PlantsState();
}

class _PlantsState extends State<Plants> {
  int price = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      body: Builder(
        builder: (context) {
          return ListView(
            children: <Widget>[
              createHeader(),
              SizedBox(
                height: 30,
              ),
              createCartList(),
              SizedBox(
                height: 70,
              ),
              //  footer(context)
            ],
          );
        },
      ),
    );
  }

  createHeader() {
    return Container(
      // alignment: Alignment.center,
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.keyboard_backspace_rounded,
                color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          SizedBox(
            width: 100,
          ),
          Text(
            "Blogs",
            style: CustomTextStyle.textFormFieldBold.copyWith(
                fontSize: 26, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: 70,
          ),
          SizedBox.fromSize(
            size: Size(50, 50), // button width and height
            child: ClipOval(
              child: Material(
                color: Colors.black, // button color
                child: InkWell(
                  splashColor: Colors.green, // splash color
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => qiz()),
                    );
                  }, // button pressed
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.contact_support_rounded,
                        size: 40,
                        color: Colors.white,
                      ), // icon
                      //  Text("Call"), // text
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      margin: EdgeInsets.only(left: 12, top: 12),
    );
  }

  createCartList() {
    return ListView.builder(
      shrinkWrap: true,
      primary: false,
      itemBuilder: (context, position) {
        return createCartListItem();
      },
      itemCount: 3,
    );
  }

  createCartListItem() {
    return Stack(
      children: <Widget>[
        Container(
          height: 150,
          margin: EdgeInsets.only(left: 16, right: 16, top: 16),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(16))),
          child: Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(right: 8, left: 8, top: 8, bottom: 8),
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(14)),
                    color: Color.fromRGBO(202, 204, 208, 1),
                    image: DecorationImage(
                        image: AssetImage("assets/pp1.png"),
                        fit: BoxFit.cover)),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(left: 10, right: 4, top: 10),
                        child: Text(
                          "2 days ago",
                          style: TextStyle(
                              color: Colors.green, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => tips()),
                                );
                              },
                              child: Text(
                                "5 Tips to treat plants",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "leaf, in botany, any usually",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "leaf, in botany, any usually",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
