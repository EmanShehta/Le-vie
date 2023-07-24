import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/screens/layout_screen.dart';
import 'package:la_vie/screens/login_screen/login_screen.dart';
import 'package:la_vie/screens/splash_screen/splash_screen.dart';
import 'package:la_vie/shared/components/constants.dart';
import 'package:la_vie/shared/cubit/cubit.dart';
import 'package:la_vie/shared/cubit/states.dart';
import 'package:la_vie/shared/network/local/cach_helper.dart';
import 'package:la_vie/shared/network/remote/dio_helper.dart';
import 'bloc_observer.dart';

void main() {
  BlocOverrides.runZoned(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await DioHelper.init();
      await CacheHelper.init();
      // starting widget
      Widget widget;
      accessToken = CacheHelper.getData(
        key: 'accessToken',
      )?? '';

      // First Page check.
      if (accessToken != '') {
        widget = LayOutScreen();
      } else {
        widget = LoginScreen();
      }
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
          .then((_) {
        runApp(MyApp(
          startWidget: widget,
        ));
      });
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  final Widget startWidget;

  const MyApp({super.key, required this.startWidget});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AppCubit(),
        ),
      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'La_vie',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: SplashScreen(
              startWidget: startWidget,
            ),
          );
        },
      ),
    );
  }
}
