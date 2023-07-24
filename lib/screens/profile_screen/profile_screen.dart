import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/screens/layout_screen.dart';
import 'package:la_vie/screens/profile_screen/updateProfile_screen/updateProfile_screen.dart';
import 'package:la_vie/shared/components/components.dart';
import 'package:la_vie/shared/cubit/cubit.dart';
import 'package:la_vie/shared/cubit/states.dart';
import 'package:la_vie/utils/size_extention.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit , AppStates>(
      listener: (context , state){},
      builder: (context , state){
        var cubit = AppCubit.get(context).profileModel;
        return Scaffold(
          extendBody: true,
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(
                Icons.keyboard_backspace,
              ),
              onPressed: () {
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LayOutScreen()), (route) => false);
              },
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_horiz),
              ),
            ],
          ),
          body: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/profile_blur.png',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                  child: Container(
                    decoration:
                    BoxDecoration(color: Colors.white.withOpacity(0.0)),
                  ),
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: ExactAssetImage('assets/images/dark.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
                  child: Container(
                    decoration:
                    BoxDecoration(color: Colors.white.withOpacity(0.0)),
                  ),
                ),
              ),
              SafeArea(
                bottom: false,
                child: Center(
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                            cubit!.data.imageUrl
                        ),
                        radius: 74,
                        backgroundColor: Colors.white,
                      ),
                      SizedBox(
                        height: 10.rh,
                      ),
                      Text(
                        '${cubit.data.firstName} ${cubit.data.lastName}',
                        style: const TextStyle(
                            letterSpacing: -0.36,
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                      SizedBox(
                        height: 27.rh,
                      ),
                      Flexible(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(
                              20,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(24.0.rSp),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 378.rw,
                                  height: 80.rh,
                                  decoration: BoxDecoration(
                                    color: const Color(0xffF3FEF1),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          'assets/images/points_padge.png',
                                          width: 38.rSp,
                                          height: 38.rSp,
                                        ),
                                        SizedBox(
                                          width: 13.rw,
                                        ),
                                        Text(
                                          'You have ${cubit.data.userPoints} Points',
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 24.rh,
                                ),
                                const Text(
                                  'Edit Profile',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20,
                                    letterSpacing: -0.36,
                                  ),
                                ),
                                SizedBox(
                                  height: 23.rh,
                                ),
                                GestureDetector(
                                  onTap: (){
                                    navigateTo(context, UpdateProfileScreen());
                                  },
                                  child: Container(
                                    width: 378.rSp,
                                    height: 85.rSp,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        width: 1,
                                        color: Colors.grey.shade300,
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: const Color(0xff6C6C6C).withOpacity(0.2),
                                          blurRadius: 1,
                                          spreadRadius: 0,
                                          offset: const Offset(0, 3),
                                        ),
                                      ],
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            'assets/images/profile_icon.png',
                                            width: 30.rSp,
                                            height: 30.rSp,
                                          ),
                                          SizedBox(
                                            width: 10.rw,
                                          ),
                                          const Text(
                                            'Change Name',
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: -0.36,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 26.rh,
                                ),
                                GestureDetector(
                                  onTap: (){
                                    navigateTo(context, UpdateProfileScreen());
                                  },
                                  child: Container(
                                    width: 378.rSp,
                                    height: 85.rSp,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        width: 1,
                                        color: Colors.grey.shade300,
                                      ),
                                      boxShadow: <BoxShadow>[
                                        BoxShadow(
                                          color: const Color(0xff6C6C6C).withOpacity(0.1),
                                          blurRadius: 20,
                                          offset: const Offset(0, 2),
                                        ),
                                      ],
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            'assets/images/profile_icon.png',
                                            width: 30.rSp,
                                            height: 30.rSp,
                                          ),
                                          SizedBox(
                                            width: 10.rw,
                                          ),
                                          const Text(
                                            'Change Email',
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: -0.36,
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
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
