import 'package:flutter/material.dart';
import 'package:plants_application/Screens/homePage.dart';

import 'package:plants_application/widgets/buttonStyle.dart';

class LoginScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  double heighttextstyle = 3;
  double heighttextfillesd = 10;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                text_style(text: "Email"),
                SizedBox(
                  height: heighttextstyle,
                ),
                textfilledstyle(),
                SizedBox(
                  height: heighttextfillesd,
                ),
                text_style(text: "Password"),
                SizedBox(
                  height: heighttextstyle,
                ),
                textfilledstyle(),
                SizedBox(
                  height: heighttextfillesd,
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: MaterialButton(
                    onPressed: () {
                      print(emailController.text);
                      print(passwordController.text);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Home()),
                      );
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  //  decoration: ,
                ),
                SizedBox(
                  height: 25.0,
                ),
                line_style(),
                SizedBox(
                  height: heighttextstyle,
                ),
                method_log_in(),
                SizedBox(height: heighttextfillesd),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
