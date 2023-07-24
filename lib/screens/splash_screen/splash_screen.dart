import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:la_vie/utils/size_extention.dart';

class SplashScreen extends StatelessWidget {
  final Widget startWidget;

  const SplashScreen({super.key, required this.startWidget});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ScreenSizes.screenWidth = size.width;
    ScreenSizes.screenHeight = size.height;
    return AnimatedSplashScreen(
        splash: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset('assets/images/img.png',
                width: 100.rSp,
                height: 100.rSp,
              ),
            ),
          ],
        ),
        nextScreen: startWidget,
    splashIconSize: 250,
      splashTransition: SplashTransition.slideTransition,
      duration: 3000,
      animationDuration: const Duration(
        seconds: 1,
      ),
    );
  }
}
