import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/screens/layout_screen.dart';
import 'package:la_vie/shared/components/components.dart';
import 'package:la_vie/shared/components/constants.dart';
import 'package:la_vie/shared/cubit/login_cubit.dart';
import 'package:la_vie/shared/cubit/login_states.dart';
import 'package:la_vie/shared/network/local/cach_helper.dart';
import 'package:la_vie/utils/size_extention.dart';

import '../../shared/components/styles/colors.dart';

class LoginScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var emailSignUpController = TextEditingController();
  var passwordSignUpController = TextEditingController();
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();

  LoginScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ScreenSizes.screenWidth = size.width;
    ScreenSizes.screenHeight = size.height;

    // free seed data
    bool? getCachedData(){
      bool? showMyDialog =  CacheHelper.getData(key: 'showMyDialog');
      return showMyDialog;
    }
    // free seed Function.
    Future<void> _showMyDialog() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false,  // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            contentPadding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0.rSp),),),
            content: SingleChildScrollView(
              child: Column(
                children:  <Widget>[
                  CachedNetworkImage(
                    imageUrl: 'https://s3-alpha-sig.figma.com/img/9e88/3e0e/c07afa070cfe7739abb3e254b0b32705?Expires=1661731200&Signature=VZw5FA9t1LvcM3LfRU-OcumK7IQ-5dHuMEnoB1bF9paZ3dVx9R4Tl9DqtT8~2i9f~TxlBqtxQRSi7T4Oj49CkHfeXOoaJVMPk7WldrRzBl6x45rCPgh-Pssr8HwGqXgJfkAjG2jRM3SqdEV8Rk0eRm8h9hzkzZqlCDvo2vNIxqbsuZ83UsVVECgEsUbN~T~q~QjHyaXKETEW5UCCienA-VGWI3Rtnx41U-lKVrILYR2wBJfKFcw3FvSa~bvHE-9JhYX6sPhfEK01ViIcVpZk8y8klD1YSuw1WacjTkPFUL8Ii1Goh1RIUuBpbEnrS4LovwyjwyRaVCeV~iPiLLbWCA__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA',
                    placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                    fit: BoxFit.cover,

                  ),
                  SizedBox(height: 10.rh,),
                  Image.asset('assets/images/img.png',
                    width: 121.rSp,
                    height: 27.rSp,
                  ),
                  SizedBox(height: 10.rh,),
                  const Text('Get Seeds For Free',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),),
                  SizedBox(height: 15.rh,),
                  const Text('Enter Your Address',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),),
                  const SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 1.rSp,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 16.0.rSp , vertical: 10.rSp),
                    child: Container(
                      decoration: BoxDecoration(
                        color: defaultColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      width: kIsWeb ? 400.0 : double.infinity,
                      child: MaterialButton(onPressed: (){
                        CacheHelper.putData(key: 'showMyDialog', value: true);
                        Navigator.pop(context);
                      }, child: const Text('Send',
                        style:TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      ),
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 16.0.rSp , vertical: 10.rSp),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xffF0F0F0),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      width: kIsWeb ? 400.0 : double.infinity,
                      child: MaterialButton(onPressed: (){
                        Navigator.pop(context);
                      }, child: const Text('Save For Later',
                        style: TextStyle(
                          color: Color(0xff979797),
                          fontWeight: FontWeight.w500,
                        ),
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

    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if(state is LoginSuccessState){
            if(state.loginModel.type == 'Success'){
              CacheHelper.saveData(key: 'accessToken', value: state.loginModel.data!.accessToken).then((value) {
                accessToken = CacheHelper.getData(key: "accessToken");

                navigateAndFinish(context, LayOutScreen());
                // Make it show only if he didn't claim his seed after every login.

                if(getCachedData() == null){
                  _showMyDialog();
                }

              });


            } else {

            }
          }else if (state is RegisterSuccessState){
            if(state.signUpModel.type == 'Success'){
              CacheHelper.saveData(key: 'accessToken', value: state.signUpModel.data!.accessToken).then((value) {
                accessToken = CacheHelper.getData(key: "accessToken");
                navigateAndFinish(context, LayOutScreen());
                // Make it show only if he didn't claim his seed after every login.

                if(getCachedData() == null){
                  _showMyDialog();
                }

              });
            }

          }
        },
        builder: (context, state) {
          return DefaultTabController(
            initialIndex: 1,
            length: 2,
            child: Scaffold(
              backgroundColor: Colors.white,
              body: Form(
                key: formKey,
                child: Stack(
                  children: [
                    Align(
                      alignment: AlignmentDirectional.bottomStart,
                      child: Visibility(
                        visible: MediaQuery.of(context).viewInsets.bottom == 0, //make the planet disapear when keyboard open.
                        child: Container(
                          height: 120.rSp,
                          width: 120.rSp,
                          color: Colors.white,
                          child: const Image(
                            image: AssetImage(
                              "assets/images/planet2.png",
                            ),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 220.rSp,
                          child: Stack(
                            children: [
                              Align(
                                alignment: AlignmentDirectional.topEnd,
                                child: (Image(
                                  image: const AssetImage(
                                    "assets/images/planet1.png",
                                  ),
                                  width: 140.rSp,
                                  height: 160.rSp,
                                )),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Image(
                                  image: const AssetImage('assets/images/img.png'),
                                  width: 102.rSp,
                                  height: 100.rSp,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Column(
                              children: [
                                TabBar(
                                  labelColor: defaultColor,
                                  unselectedLabelColor: const Color(0xff8A8A8A),
                                  indicatorColor: defaultColor,
                                  indicatorSize: TabBarIndicatorSize.label,
                                  tabs: const <Widget>[
                                    Tab(
                                      text: 'Sign up',
                                    ),
                                    Tab(
                                      text: 'Login',
                                    ),
                                  ],
                                ),
                                Expanded(
                                  child: TabBarView(
                                    children: [

                                      //Sign Up.
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 45.0.rSp,
                                          vertical: 10.rSp,
                                        ),
                                        child: ListView(
                                          children: [
                                            SizedBox(
                                              height: 33.h,
                                              child: ListView(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                        child: Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            const Text(
                                                              'First Name',
                                                              style: TextStyle(
                                                                fontSize: 14,
                                                                color: Color(0xff6F6F6F),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 5.rw,
                                                            ),
                                                            SizedBox(
                                                              height: 46.rh,
                                                              child: TextFormField(
                                                                controller:
                                                                firstNameController,
                                                                validator:
                                                                    (String? value) {
                                                                  if (value!.isEmpty) {
                                                                    return 'Type Your first name';
                                                                  }
                                                                  return null;
                                                                },
                                                                keyboardType:
                                                                TextInputType
                                                                    .text,
                                                                decoration:
                                                                InputDecoration(
                                                                    border:
                                                                    OutlineInputBorder(
                                                                      borderRadius:
                                                                      BorderRadius
                                                                          .circular(5),
                                                                    )),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 25.rw,
                                                      ),
                                                      Expanded(
                                                        child: Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            const Text(
                                                              'Last Name',
                                                              style: TextStyle(
                                                                fontSize: 14,
                                                                color: Color(0xff6F6F6F),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 5.rw,
                                                            ),
                                                            SizedBox(
                                                              height: 46.rh,
                                                              child: TextFormField(
                                                                controller:
                                                                lastNameController,
                                                                validator:
                                                                    (String? value) {
                                                                  if (value!.isEmpty) {
                                                                    return 'Type Your Email';
                                                                  }
                                                                  return null;
                                                                },
                                                                keyboardType:
                                                                TextInputType
                                                                    .text,
                                                                decoration:
                                                                InputDecoration(
                                                                    border:
                                                                    OutlineInputBorder(
                                                                      borderRadius:
                                                                      BorderRadius
                                                                          .circular(5),
                                                                    )),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),

                                                    ],
                                                  ),

                                                  SizedBox(
                                                    height: 25.rh,
                                                  ),
                                                  const Text(
                                                    'Email',
                                                    style: TextStyle(
                                                      color: Color(0xff6F6F6F),
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 5.rh,
                                                  ),
                                                  SizedBox(
                                                    height: 46.rh,
                                                    child: TextFormField(
                                                      controller:
                                                      emailSignUpController,
                                                      validator:
                                                          (String? value) {
                                                        if (value!.isEmpty) {
                                                          return 'Type Your Email';
                                                        }
                                                        return null;
                                                      },
                                                      keyboardType:
                                                      TextInputType
                                                          .emailAddress,
                                                      decoration:
                                                      InputDecoration(
                                                          border:
                                                          OutlineInputBorder(
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                          )),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 25.rh,
                                                  ),
                                                  const Text(
                                                    'Password',
                                                    style: TextStyle(
                                                      color: Color(0xff6F6F6F),
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 5.rw,
                                                  ),
                                                  SizedBox(
                                                    height: 46.rh,
                                                    child: TextFormField(
                                                      obscureText: true,
                                                      onFieldSubmitted: (value){
                                                        if(formKey.currentState!.validate()){
                                                          LoginCubit.get(context)
                                                              .userRegister(
                                                            firsName: firstNameController.text,
                                                              lastName: lastNameController.text,
                                                              email:
                                                              emailSignUpController
                                                                  .text,
                                                              password:
                                                              passwordSignUpController
                                                                  .text);
                                                        }
                                                      },
                                                      controller:
                                                      passwordSignUpController,
                                                      keyboardType:
                                                      TextInputType
                                                          .visiblePassword,
                                                      validator:
                                                          (val) => val!.length < 6 ? 'Password too short.' : null,

                                                      decoration:
                                                      InputDecoration(
                                                          border:
                                                          OutlineInputBorder(
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                          )),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: 46.rh,
                                              width: 100.w,
                                              child: MaterialButton(
                                                onPressed: () {
                                                  LoginCubit.get(context)
                                                      .userRegister(
                                                      firsName: firstNameController.text,
                                                      lastName: lastNameController.text,
                                                      email:
                                                      emailSignUpController
                                                          .text,
                                                      password:
                                                      passwordSignUpController
                                                          .text);
                                                },
                                                color: defaultColor,
                                                textColor: Colors.white,
                                                child: const Text(
                                                  'Sign Up',
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 28.rh,
                                            ),
                                            Row(
                                              children: [
                                                Flexible(
                                                  child: Container(
                                                    height: 1,
                                                    color: const Color(0xff979797),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 5.rw,
                                                ),
                                                const Text(
                                                  'or continue with',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: Color(0xff979797),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 5.rw,
                                                ),
                                                Flexible(
                                                  child: Container(
                                                    height: 1,
                                                    color: const Color(0xff979797),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 22.17.rh,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Image(
                                                  image: const AssetImage(
                                                    "assets/images/google.png",
                                                  ),
                                                  width: 21.63.rSp,
                                                  height: 20.96.rSp,
                                                  fit: BoxFit.cover,
                                                ),
                                                SizedBox(
                                                  width: 26.6.rw,
                                                ),
                                                Image(
                                                  image: const AssetImage(
                                                    "assets/images/fb.png",
                                                  ),
                                                  width: 15.rSp,
                                                  height: 25.rSp,
                                                  fit: BoxFit.cover,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      //Log In
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 45.0.rSp,
                                          vertical: 10.rSp,
                                        ),
                                        child: ListView(
                                          children: [
                                            SizedBox(
                                              height: 25.h,
                                              child: ListView(
                                                children: [
                                                  const Text(
                                                    'Email',
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      color: Color(0xff6F6F6F),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 5.rh,
                                                  ),
                                                  SizedBox(
                                                    height: 46.rh,
                                                    child: TextFormField(
                                                      controller:
                                                          emailController,
                                                      validator:
                                                          (String? value) {
                                                        if (value!.isEmpty) {
                                                          return 'Type Your Email';
                                                        }
                                                        return null;
                                                      },
                                                      keyboardType:
                                                          TextInputType
                                                              .emailAddress,
                                                      decoration:
                                                          InputDecoration(
                                                              border:
                                                                  OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                      )),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 25.rh,
                                                  ),
                                                  const Text(
                                                    'Password',
                                                    style: TextStyle(
                                                      color: Color(0xff6F6F6F),
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 5.rh,
                                                  ),
                                                  SizedBox(
                                                    height: 46.rh,
                                                    child: TextFormField(
                                                      obscureText: true,
                                                      onFieldSubmitted: (value){
                                                        if(formKey.currentState!.validate()){
                                                          LoginCubit.get(context)
                                                              .userLogin(
                                                              email:
                                                              emailController
                                                                  .text,
                                                              password:
                                                              passwordController
                                                                  .text);
                                                        }
                                                      },
                                                      controller:
                                                          passwordController,
                                                      keyboardType:
                                                          TextInputType
                                                              .visiblePassword,
                                                      validator:
                                                          (val) => val!.length < 6 ? 'Password too short.' : null,

                                                      decoration:
                                                          InputDecoration(
                                                              border:
                                                                  OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                      )),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: 46.rh,
                                              width: 100.w,
                                              child: (state
                                                      is! LoginLoadingState)
                                                  ? MaterialButton(
                                                      onPressed: () {
                                                       if(formKey.currentState!.validate()){
                                                         LoginCubit.get(context)
                                                             .userLogin(
                                                             email:
                                                             emailController
                                                                 .text,
                                                             password:
                                                             passwordController
                                                                 .text);
                                                       }
                                                      },
                                                      color: defaultColor,
                                                      textColor: Colors.white,
                                                      child: const Text(
                                                        'Login',
                                                      ),
                                                    )
                                                  : const Center(
                                                      child:
                                                          CircularProgressIndicator(),
                                                    ),
                                            ),
                                            SizedBox(
                                              height: 28.rh,
                                            ),
                                            Row(
                                              children: [
                                                Flexible(
                                                  child: Container(
                                                    height: 1,
                                                    color: const Color(0xff979797),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 5.rw,
                                                ),
                                                const Text(
                                                  'or continue with',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: Color(0xff979797),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 5.rw,
                                                ),
                                                Flexible(
                                                  child: Container(
                                                    height: 1,
                                                    color: const Color(0xff979797),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 22.17.rh,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Image(
                                                  image: const AssetImage(
                                                    "assets/images/google.png",
                                                  ),
                                                  width: 21.63.rSp,
                                                  height: 20.96.rSp,
                                                  fit: BoxFit.cover,
                                                ),
                                                SizedBox(
                                                  width: 26.6.rw,
                                                ),
                                                Image(
                                                  image: const AssetImage(
                                                    "assets/images/fb.png",
                                                  ),
                                                  width: 15.rSp,
                                                  height: 25.rSp,
                                                  fit: BoxFit.cover,
                                                ),
                                              ],
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
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
