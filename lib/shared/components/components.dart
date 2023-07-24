import 'package:flutter/material.dart';
import 'package:la_vie/screens/login_screen/login_screen.dart';
import 'package:la_vie/shared/network/local/cach_helper.dart';
Widget defaultFormField ({
  required TextEditingController controller,
  required TextInputType type,
  void Function(String)? onSubmit,
  void Function(String)? onChange,
  required Function validate,
  required String label,
   IconData? prefix,
  IconData? suffix,
  bool isPass = false,
  void Function()? suffixPressed,
  String? errorText,
}) => TextFormField(

  decoration: InputDecoration(
    errorText: errorText,
    labelText: label,
    prefixIcon: Icon(
      prefix,
    ),
    suffixIcon: suffix != null ? IconButton(
      onPressed: suffixPressed,
      icon: Icon(
          suffix
      ),
    ) : null ,
    border: const OutlineInputBorder(),
  ),

  controller: controller,
  keyboardType: type,
  obscureText: isPass,
  onFieldSubmitted: onSubmit,
  validator: (value){
    if(value!.isEmpty) {
      return 'User Must Input Data';
    }
    return null;
  },
);


void navigateTo(context, widget)
{
  Navigator.push(context, MaterialPageRoute(builder:
      (context) => widget,
  ),);
}

void navigateAndFinish(context, widget)
{
  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
    builder: (context) => widget,
  ),
        (Route<dynamic> route) => false,
  );
}


signOut (context){
  CacheHelper.removeData(key: 'accessToken').then((value) {
    navigateAndFinish(context, LoginScreen());
  });
}