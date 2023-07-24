import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:la_vie/shared/network/local/cach_helper.dart';
import 'package:la_vie/utils/size_extention.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/home_model.dart';
import '../../shared/components/styles/colors.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<ProductData> cartProducts = [];

  getCartLocalData() {
    String? cartData = CacheHelper.getData(key: 'cart');
    if (cartData != null) {
      // assign cart data to products data.
      List<dynamic> decodedData = json.decode(cartData);
      // CartListResponse.fromJson(jsonDecode(response.body)).toList();
      // Map<String,dynamic> userMap = jsonDecode(cartData) as Map<String, dynamic>;
      // print(userMap);
      List<ProductData> data = List.generate(decodedData.length,
          (index) => ProductData.fromJson(decodedData[index]));
      // List<ProductData> data = List.from(userMap.map((e)=>ProductData.fromJson(e)).toList());
      setState(() {
        cartProducts = data;
      });
    }
  }

  @override
  void initState() {
    getCartLocalData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return cartProducts.isEmpty
        ? emptyCartScaffold()
        : Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              iconTheme: IconThemeData(
                color: Colors.black,
              ),
              backgroundColor: Colors.white,
              elevation: 0,
              centerTitle: true,
              title: Text(
                'My Cart',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            body: ListView.builder(
              itemBuilder: (context, index) => buildCartItem(
                cartProduct: cartProducts[index],
              ),
              itemCount: cartProducts.length,
            ),
          );
  }

  Widget emptyCartScaffold() => Scaffold(
    backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'My Cart',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 25,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 100.rh,
                ),
                Center(
                  child: Image.asset(
                    'assets/images/not_found.png',
                    width: 250.rSp,
                    height: 244.rSp,
                  ),
                ),
                SizedBox(
                  height: 40.rh,
                ),
                Text(
                  'Your cart is empty',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 12.rh,
                ),
                Text(
                  'Sorry, the keyword you entered cannot be found, please check again or search with another keyword.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    color: Color(0xff212121).withOpacity(0.61),
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  Widget buildCartItem({required ProductData cartProduct}) => Container(
        padding: EdgeInsets.all(10.rSp),
        margin: EdgeInsets.all(20.rSp),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              offset: Offset(10,4),
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
                child: Image.network(
                  'https://lavie.orangedigitalcenteregypt.com${cartProduct.imageUrl}',
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
                    '${cartProduct.name}',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: 20.rh,
                  ),
                  Text(
                    '${cartProduct.price} EGP',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: defaultColor,
                    ),
                  ),
                  SizedBox(
                    height: 20.rh,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xffF8F8F8),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(7.0.rSp),
                          child: InkWell(
                            child: Icon(
                              Icons.remove,
                              size: 15,
                              color: defaultColor,
                            ),
                            onTap: (){
                              if(cartProduct.quantity != 1){
                                cartProduct.quantity = cartProduct.quantity! - 1;
                                setState(() {

                                });
                              }

                            },
                          ),
                        ),
                        Text('${cartProduct.quantity}',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 7.0.rSp, vertical: 10.rSp),
                          child: InkWell(
                              child: Icon(
                                Icons.add,
                                size: 15,
                                color: defaultColor,
                              ),
                              onTap: () {
                                cartProduct.quantity =
                                    cartProduct.quantity! + 1;
                                setState(() {});
                              }),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {
                cartProducts.remove(cartProduct);
                List<Map<String, dynamic>> productsMap = List.generate(
                    cartProducts.length,
                    (index) => cartProducts[index].toJson());
                storeCart(productsMap) async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  await prefs.setString('cart', json.encode(productsMap));
                }

                storeCart(productsMap);
                setState(() {});
              },
              icon: Icon(Icons.delete,
              size: 30,
              color: defaultColor,
              ),
            ),
          ],
        ),
      );
}
