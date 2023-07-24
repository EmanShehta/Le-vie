import 'dart:convert';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/models/seed_model.dart';
import 'package:la_vie/models/tools_model.dart';
import 'package:la_vie/screens/cart_screen/cart_screen.dart';
import 'package:la_vie/screens/search_screen/search_screen.dart';
import 'package:la_vie/shared/components/components.dart';
import 'package:la_vie/shared/components/styles/colors.dart';
import 'package:intl/intl.dart';
import 'package:la_vie/shared/cubit/cubit.dart';
import 'package:la_vie/shared/cubit/states.dart';
import 'package:la_vie/shared/network/local/cach_helper.dart';
import 'package:la_vie/utils/size_extention.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../models/home_model.dart';
import '../../models/planets_model.dart';
import '../fourms_screen/fourm_screen.dart';
import '../quiz_screen/quiz_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int tapIndex = 0;
  int index = 0;

  Color tapColor = Colors.grey;
  String day = DateFormat('EEEE').format(DateTime.now()); //get Today name.

  List<ProductData> cartProducts = [];

  getCartLocalData() {
    String? cartData = CacheHelper.getData(key: 'cart');
    if (cartData != null) {
      // assign cart data to products data.
      List<dynamic> decodedData = json.decode(cartData);
      // CartListResponse.fromJson(jsonDecode(response.body)).toList();
      // Map<String,dynamic> userMap = jsonDecode(cartData) as Map<String, dynamic>;
      // print(userMap);
      cartProducts = List.generate(decodedData.length,
          (index) => ProductData.fromJson(decodedData[index]));
      // List<ProductData> data = List.from(userMap.map((e)=>ProductData.fromJson(e)).toList());
      setState(() {});
    }
  }

  @override
  // void initState() {
  //   getCartLocalData();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ScreenSizes.screenWidth = size.width;
    ScreenSizes.screenHeight = size.height;

    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var myCubit = AppCubit.get(context);

        return  Scaffold(
                drawer:myCubit.profileModel == null ?const Center(child: CircularProgressIndicator()) : Container(
                  width: MediaQuery.of(context).size.width *
                      0.66, // 66% of screen will be occupied
                  color: Colors.grey,
                  child: Drawer(
                    elevation: 10,
                    child: SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 50,
                              backgroundImage: NetworkImage(
                                AppCubit.get(context).profileModel!.data.imageUrl,
                              ),
                              backgroundColor: defaultColor,
                            ),
                            SizedBox(
                              height: 10.rh,
                            ),
                            Text(
                              '${AppCubit.get(context).profileModel!.data.firstName} ${AppCubit.get(context).profileModel!.data.lastName}',
                              style: const TextStyle(
                                fontSize: 16,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 20.rSp),
                              color: Colors.grey.shade200,
                              width: double.infinity,
                              child: ListTile(
                                horizontalTitleGap: 0,
                                title: const Text(
                                  'Explore',
                                  style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16,
                                  ),
                                ),
                                leading: Icon(
                                  Icons.explore,
                                  color: defaultColor,
                                ),
                                contentPadding: EdgeInsets.all(10.rSp),
                                dense: true,
                                textColor: Colors.black54,
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.symmetric(horizontal: 10.0.rSp),
                              child: InkWell(
                                onTap: () {
                                  navigateTo(context, const ForumsScreen());
                                },
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.people,
                                      color: defaultColor,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Text(
                                      'Community',
                                      style: TextStyle(
                                        fontFamily: 'Roboto',
                                        color: Colors.black54,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30.rh,
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.symmetric(horizontal: 10.0.rSp),
                              child: InkWell(
                                onTap: () {},
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.policy,
                                      color: defaultColor,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Text(
                                      'Terms and policy',
                                      style: TextStyle(
                                        fontFamily: 'Roboto',
                                        color: Colors.black54,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30.rh,
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.symmetric(horizontal: 10.0.rSp),
                              child: InkWell(
                                onTap: () {
                                  signOut(context);
                                },
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.logout,
                                      color: defaultColor,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Text(
                                      'Log Out',
                                      style: TextStyle(
                                        fontFamily: 'Roboto',
                                        color: Colors.black54,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                backgroundColor: Colors.white,
                appBar: AppBar(
                  iconTheme: const IconThemeData(
                    color: Colors.black,
                  ),
                  actions: [
                    InkWell(
                      onTap: () {
                        navigateAndFinish(
                          context,
                          QuizScreen(),
                        );
                      },
                      child: Visibility(
                        visible: (day == 'Thursday') ? true : false,
                        child: AvatarGlow(
                          endRadius: 45.rSp,
                          glowColor: Colors.green.shade300,
                          duration: const Duration(milliseconds: 500),
                          child: Container(
                            margin: EdgeInsets.zero,
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white,
                                width: 1,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(.5),
                                  blurRadius: 5,
                                  offset: const Offset(0, 3),
                                  spreadRadius: 2,
                                )
                              ],
                              shape: BoxShape.circle,
                              color: defaultColor,
                            ),
                            child: const Center(
                              child: Text(
                                '?',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 24,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                  elevation: 0,
                  backgroundColor: Colors.white,
                  centerTitle: true,
                  title: PreferredSize(
                    preferredSize: Size.fromHeight(51.rSp),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image(
                        image: const AssetImage(
                          'assets/images/img.png',
                        ),
                        width: 102.rSp,
                        height: 33.rSp,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                body: myCubit.homeModel == null
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 20),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Flexible(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Container(
                                      color: const Color(0xffF8F8F8),
                                      height: 46.rh,
                                      child: TextField(
                                        onTap: () {
                                          navigateTo(
                                            context,
                                            SearchScreen(),
                                          );
                                        },
                                        decoration: InputDecoration(
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                            horizontal: 16,
                                          ),
                                          hintText: 'Search',
                                          hintStyle: const TextStyle(
                                            color: Color(0xff979797),
                                          ),
                                          prefixStyle: const TextStyle(
                                            color: Color(0xff979797),
                                          ),
                                          prefixIconConstraints: BoxConstraints(
                                              minHeight: 17.rh,
                                              minWidth: 17.rh),
                                          prefixIcon: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 16.0.rSp),
                                            child: Image(
                                              width: 17.rSp,
                                              height: 17.rSp,
                                              image: const AssetImage(
                                                  'assets/images/Search.png'),
                                            ),
                                          ),
                                          border: InputBorder.none,
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: BorderSide(
                                              width: 1,
                                              color: defaultColor,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 16.rw,
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Container(
                                    color: defaultColor,
                                    width: 51,
                                    height: 46,
                                    child: IconButton(
                                      icon: const Image(
                                        image: AssetImage(
                                            'assets/images/Cart.png'),
                                      ),
                                      onPressed: () {
                                        navigateTo(context, const CartScreen());
                                      },
                                    ),
                                  ),
                                )
                              ],
                            ),
                            DefaultTabController(
                              initialIndex: tapIndex,
                              length: 4,
                              child: Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 26.0),
                                  child: Column(
                                    children: [
                                      TabBar(
                                        indicator: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                            width: 2,
                                            color: defaultColor,
                                          ),
                                        ),
                                        indicatorSize: TabBarIndicatorSize.tab,
                                        labelColor: defaultColor,
                                        unselectedLabelColor:
                                            const Color(0xff8A8A8A),
                                        indicatorColor: Colors.transparent,
                                        tabs: const <Widget>[
                                          Tab(
                                            text: 'All',
                                          ),
                                          Tab(
                                            text: 'Plants',
                                          ),
                                          Tab(
                                            text: 'Seeds',
                                          ),
                                          Tab(
                                            text: 'Tools',
                                          ),
                                        ],
                                      ),
                                      Expanded(
                                        child: TabBarView(
                                          children: [
                                            SizedBox(
                                              height: double.infinity,
                                              width: 100.rw,
                                              child: Column(
                                                children: [
                                                  Expanded(
                                                    child: GridView.count(
                                                      crossAxisCount: 2,
                                                      mainAxisSpacing: 1,
                                                      crossAxisSpacing: 1,
                                                      childAspectRatio: 0.55,
                                                      children: List.generate(
                                                        myCubit.homeModel!.data
                                                            .length,
                                                        (index) =>
                                                            buildGridItem(
                                                          model: myCubit
                                                              .homeModel!
                                                              .data[index],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: double.infinity,
                                              width: 100.rw,
                                              child: Column(
                                                children: [
                                                  Expanded(
                                                    child:myCubit.planetModel == null ? const Center(child: CircularProgressIndicator()) : GridView.count(
                                                      crossAxisCount: 2,
                                                      mainAxisSpacing: 1,
                                                      crossAxisSpacing: 1,
                                                      childAspectRatio: 0.55,
                                                      children: List.generate(
                                                        myCubit.planetModel!
                                                            .data!.length,
                                                        (index) =>
                                                            buildPlanetItem(
                                                          model: myCubit
                                                              .planetModel!
                                                              .data![index],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: double.infinity,
                                              width: 100.rw,
                                              child: Column(
                                                children: [
                                                  Expanded(
                                                    child:myCubit.seedModel == null ? Center(child: CircularProgressIndicator(),) : GridView.count(
                                                      crossAxisCount: 2,
                                                      mainAxisSpacing: 1,
                                                      crossAxisSpacing: 1,
                                                      childAspectRatio: 0.55,
                                                      children: List.generate(
                                                        myCubit.seedModel!.data!
                                                            .length,
                                                        (index) =>
                                                            buildSeedItem(
                                                          model: myCubit
                                                              .seedModel!
                                                              .data![index],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: double.infinity,
                                              width: 100.rw,
                                              child: Column(
                                                children: [
                                                  Expanded(
                                                    child:myCubit.toolsModel == null  ? Center(child: CircularProgressIndicator(),) : GridView.count(
                                                      crossAxisCount: 2,
                                                      mainAxisSpacing: 1,
                                                      crossAxisSpacing: 1,
                                                      childAspectRatio: 0.55,
                                                      children: List.generate(
                                                        myCubit.toolsModel!
                                                            .data!.length,
                                                        (index) =>
                                                            buildToolsItem(
                                                          model: myCubit
                                                              .toolsModel!
                                                              .data![index],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
              );
      },
    );
  }

  Widget buildGridItem({required ProductData model}) => Container(
        margin: EdgeInsets.all(
          10.rh,
        ),
        width: 176.rw,
        height: 230.rh,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              spreadRadius: 2,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(7.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Flexible(
                    child: SizedBox(
                      width: 100,
                      height: 100,
                      child: Image.network(
                        'https://lavie.orangedigitalcenteregypt.com${model.imageUrl!}',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      //this to make quantity never reach 0.
                      if (model.quantity != 1) {
                        model.quantity = model.quantity! - 1;
                        setState(() {});
                      }
                    },
                    child: Container(
                      color: const Color(0xffF7F6F7),
                      width: 16.rSp,
                      height: 16.rSp,
                      child: Center(
                        child: Image.asset(
                          'assets/images/minus.png',
                          width: 8.rSp,
                          height: 8.rSp,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 7.rw,
                  ),
                  Text(
                    '${model.quantity}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: 7.rw,
                  ),
                  InkWell(
                    onTap: () {
                      model.quantity = model.quantity! + 1;
                      setState(() {});
                    },
                    child: Container(
                      color: const Color(0xffF7F6F7),
                      width: 16.rSp,
                      height: 16.rSp,
                      child: Center(
                        child: Image.asset(
                          'assets/images/plus.png',
                          width: 8.rSp,
                          height: 8.rSp,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 45.rh,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 7.0),
                child: Text(
                  model.name!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(
                height: 7.rh,
              ),
              Text(
                '${model.price!} EGP',
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 7.rh,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                height: 35.rh,
                child: Material(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: MaterialButton(
                    onPressed: () {
                      storeCart(productsMap) async {
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        await prefs.setString('cart', json.encode(productsMap));
                      }

                      // fetch old data from shared.
                      getCartLocalData();
                      //لو هو فاضي هيضيف
                      if (cartProducts.isEmpty) {
                        cartProducts.add(model);
                        // convert to list of map<string , dynamic> so we can save inside shared
                        List<Map<String, dynamic>> productsMap = List.generate(
                            cartProducts.length,
                            (index) => cartProducts[index].toJson());
                        // pass the data to method so its saved.
                        storeCart(productsMap);
                      } else {
                        // لو مليان هبحث عن الاي دي فيهم وازوده
                        if (cartProducts
                            .where((element) =>
                                element.productId == model.productId)
                            .toList()
                            .isNotEmpty) {
                          // fetch the data of the only product have the id of cart item
                          ProductData oldExsitedProduct = cartProducts
                              .where((element) =>
                                  element.productId == model.productId)
                              .toList()[0];
                          // when we find the same product in cart we just add quantity not new product
                          oldExsitedProduct.quantity =
                              model.quantity! + oldExsitedProduct.quantity!;

                          List<Map<String, dynamic>> productsMap =
                              List.generate(cartProducts.length,
                                  (index) => cartProducts[index].toJson());
                          storeCart(productsMap);
                        } else {
                          // if product id not in list we add it new product to cart then we save the new data.
                          cartProducts.add(model);
                          List<Map<String, dynamic>> productsMap =
                              List.generate(cartProducts.length,
                                  (index) => cartProducts[index].toJson());
                          storeCart(productsMap);
                        }
                      }

                      setState(() {});
                    },
                    color: defaultColor,
                    child: const Text(
                      'Add To Cart',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  Widget buildPlanetItem({required PlanetsData model}) => Container(
        margin: EdgeInsets.all(
          10.rh,
        ),
        width: 176.rw,
        height: 230.rh,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              spreadRadius: 2,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(7.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: model.imageUrl != ''
                      ? Image.network(
                          'https://lavie.orangedigitalcenteregypt.com${model.imageUrl!}',
                          width: 100.rSp,
                          height: 100.rSp,
                          fit: BoxFit.cover,
                        )
                      : Image.network(
                          'https://mir-s3-cdn-cf.behance.net/project_modules/disp/917cf373927307.5c1a39abc8ff6.png',
                          width: 100.rSp,
                          height: 100.rSp,
                        ),
                ),
              ),
              SizedBox(
                height: 10.rh,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 7.0),
                child: Text(
                  model.name!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(
                height: 7.rh,
              ),
              Text(
                model.description!,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Colors.grey.shade600,
                  fontSize: 12,
                ),
              ),
              SizedBox(
                height: 10.rh,
              ),
              Text(
                'Temp : ${model.temperature} C ',
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Roboto',
                  fontSize: 12,
                ),
              ),
              SizedBox(
                height: 10.rh,
              ),
              Text(
                'Sun Light : ${model.sunLight} % ',
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Roboto',
                  fontSize: 12,
                ),
              ),
              SizedBox(
                height: 10.rh,
              ),
              Text(
                'Water Capacity : ${model.waterCapacity} %',
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Roboto',
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      );

  Widget buildSeedItem({required SeedData model}) => Container(
        margin: EdgeInsets.all(
          10.rh,
        ),
        padding: const EdgeInsets.all(10),
        width: 176.rw,
        height: 230.rh,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              spreadRadius: 2,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(7.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Container(
                  width: 100.rSp,
                  height: 100.rSp,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: model.imageUrl != ''
                      ? Image.network(
                          'https://lavie.orangedigitalcenteregypt.com${model.imageUrl!}',
                          fit: BoxFit.cover,
                        )
                      : Image.network(
                          'https://mir-s3-cdn-cf.behance.net/project_modules/disp/917cf373927307.5c1a39abc8ff6.png',
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.contain,
                        ),
                ),
              ),
              SizedBox(
                height: 45.rh,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 7.0),
                child: Text(
                  model.name!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(
                height: 7.rh,
              ),
              Text(
                model.description!,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      );

  Widget buildToolsItem({required ToolsData model}) => Container(
        margin: EdgeInsets.all(
          10.rh,
        ),
        width: 150.rw,
        height: 200.rh,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              spreadRadius: 2,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(7.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Flexible(
                child: Container(
                  width: 100.rSp,
                  height: 100.rSp,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: model.imageUrl != ''
                      ? Image.network(
                          'https://lavie.orangedigitalcenteregypt.com${model.imageUrl!}',
                          fit: BoxFit.cover,
                        )
                      : Image.network(
                          'https://mir-s3-cdn-cf.behance.net/project_modules/disp/917cf373927307.5c1a39abc8ff6.png',
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.contain,
                        ),
                ),
              ),
              SizedBox(
                height: 45.rh,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 7.0),
                child: Text(
                  model.name!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(
                height: 7.rh,
              ),
              Text(
                model.description!,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      );
}
