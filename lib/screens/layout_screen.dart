import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/shared/components/styles/colors.dart';
import 'package:la_vie/shared/cubit/cubit.dart';
import 'package:la_vie/shared/cubit/states.dart';
import 'package:la_vie/utils/size_extention.dart';

class LayOutScreen extends StatefulWidget {


  @override
  State<LayOutScreen> createState() => _LayOutScreenState();
}

class _LayOutScreenState extends State<LayOutScreen> {
  fetchData()async{
    await AppCubit.get(context).getUserData();
    await AppCubit.get(context).getProducts();
    await   AppCubit.get(context).getPlanets();
    await  AppCubit.get(context).getSeeds();
    await  AppCubit.get(context).getTools();
  }
  @override
  void initState() {
   fetchData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ScreenSizes.screenWidth = size.width;
    ScreenSizes.screenHeight = size.height;
    return BlocConsumer<AppCubit , AppStates>(
      listener: (context , state){},
      builder: (context , state){
        final items = [
          Image(image: const AssetImage('assets/images/leave.png') , width: 24.rSp, height: 24.rSp, color: AppCubit.get(context).currentIndex == 0 ? Colors.white : Colors.black,),
          Image(image: const AssetImage('assets/images/qr.png') , width: 24.rSp, height: 24.rSp, color: AppCubit.get(context).currentIndex == 1 ? Colors.white : Colors.black,),
          Image(image: const AssetImage('assets/images/home.png') , width: 25.rSp, height: 25.rSp, color: AppCubit.get(context).currentIndex == 2 ? Colors.white : Colors.black,),
          Image(image: AssetImage(AppCubit.get(context).currentIndex == 3 ? 'assets/images/Bell.png' : 'assets/images/bell2.png' ,) , width: 24.rSp, height: 24.rSp, color: AppCubit.get(context).currentIndex == 3 ? Colors.white :  null),
          Image(image: const AssetImage('assets/images/profile.png') , width: 24.rSp, height: 24.rSp, color: AppCubit.get(context).currentIndex == 4 ? Colors.white : Colors.black,),
        ];
        var cubit = AppCubit.get(context);
        return Scaffold(
          extendBody: true,
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 100,
                  offset: const Offset(0,3),
                )
              ]
            ),
            child: CurvedNavigationBar(
              backgroundColor: Colors.transparent,
              buttonBackgroundColor: defaultColor,
              height: 64.rh,
              index: cubit.currentIndex,
              onTap: (index) {
                cubit.changeBottomNav(index , context);

              },
              animationDuration: const Duration(
                milliseconds: 300,
              ),
              items: items,
            ),
          ),

        );
      },
    );
  }
}




