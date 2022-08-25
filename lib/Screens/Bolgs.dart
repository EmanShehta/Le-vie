import 'package:flutter/material.dart';
import 'package:plants_application/widgets/CustomTextStyle.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
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
              footer(context)
            ],
          );
        },
      ),
    );
  }

  footer(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 30),
                child: Text(
                  "Total",
                  style: CustomTextStyle.textFormFieldMedium.copyWith(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 30),
                child: Text(
                  "\$299.00",
                  style: CustomTextStyle.textFormFieldBlack.copyWith(
                      color: Colors.greenAccent.shade700, fontSize: 20),
                ),
              ),
            ],
          ),
          //   Utils.getSizedBox(height: 8),
          // ignore: deprecated_member_use
          RaisedButton(
            /* onPressed: () {
              Navigator.push(context, new MaterialPageRoute(builder: (context) => CheckOutPage()));
            },*/
            color: Colors.green,
            padding: EdgeInsets.only(top: 12, left: 60, right: 60, bottom: 12),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            onPressed: () {},
            child: Text(
              "Checkout",
              style: CustomTextStyle.textFormFieldSemiBold
                  .copyWith(color: Colors.white),
            ),
          ),
          // Utils.getSizedBox(height: 8),
        ],
      ),
      margin: EdgeInsets.only(top: 16),
    );
  }

  createHeader() {
    return Container(
      alignment: Alignment.center,
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
            "My Cart",
            style: CustomTextStyle.textFormFieldBold.copyWith(
                fontSize: 26, color: Colors.black, fontWeight: FontWeight.bold),
          ),
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
                          "Cactus plant",
                          maxLines: 2,
                          softWrap: true,
                          style: CustomTextStyle.textFormFieldSemiBold
                              .copyWith(fontSize: 18),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "\$299.00",
                              style: CustomTextStyle.textFormFieldBlack
                                  .copyWith(color: Colors.green),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: 90,
                        height: 50,
                        //color: Color.fromRGBO(227, 227, 227, 0.9),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(14)),
                          color: Color.fromRGBO(202, 204, 208, 0.4),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: Center(
                            child: Row(
                              //mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 25,
                                  height: 25,
                                  color: Colors.transparent,
                                  child: FloatingActionButton(
                                    onPressed: () {
                                      setState(() {
                                        price--;
                                      });
                                    },
                                    heroTag: price,
                                    mini: true,
                                    backgroundColor:
                                        Color.fromRGBO(227, 227, 227, 0.9),
                                    elevation: 10,
                                    child: Icon(
                                      Icons.remove,
                                      color: Colors.green,
                                      size: 20,
                                    ),
                                    // shape: RoundedRectangleBorder(),
                                  ),
                                ),
                                SizedBox(
                                  width: 3,
                                ),
                                Text(
                                  '${price}',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(
                                  width: 3,
                                ),
                                Container(
                                  width: 25,
                                  height: 25,
                                  child: FloatingActionButton(
                                    backgroundColor:
                                        Color.fromRGBO(227, 227, 227, 0.9),
                                    elevation: 10,
                                    onPressed: () {
                                      setState(() {
                                        price++;
                                      });
                                    },
                                    heroTag: 'age+',
                                    mini: true,
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.green,
                                      size: 20,
                                    ),

                                    //  shape: RoundedRectangleBorder(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Container(
            width: 24,
            height: 24,
            alignment: Alignment.center,
            margin: EdgeInsets.only(right: 10, top: 8),
            child: Icon(
              Icons.close,
              color: Colors.white,
              size: 20,
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                color: Colors.green),
          ),
        )
      ],
    );
  }
}
