import 'package:flutter/material.dart';

// ignore: camel_case_types
class button extends StatelessWidget {
  final String text;
  final Size size;
  const button({required this.text, required this.size});
  @override
  Widget build(BuildContext context) {
    return TextButton(
      /*  onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => MyHomePage()));
      },*/
      onPressed: () {},
      child: Container(
        height: 60,
        width: 240,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.deepOrangeAccent.withOpacity(0.85),
          borderRadius: BorderRadius.circular(35),
        ),
        child: Text(
          text,
          style: TextStyle(
              fontSize: 23, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class buttonwithicon extends StatelessWidget {
  final int size;
  final Color color;
  final IconData icon;
  const buttonwithicon(
      {required this.size, required this.color, required this.icon});
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Container(
          // alignment: Alignment.center,
          height: 30,
          width: 40,
          decoration: BoxDecoration(
            color: color, //parameter
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                //color: Colors.white,
              ),
              SizedBox(
                width: 7,
              ),
            ],
          )),
    );
  }
}

// ignore: camel_case_types
class buttonwithicon1 extends StatelessWidget {
  final Size size;
  final Color color;
  final String text;
  final IconData icon;
  const buttonwithicon1(
      {required this.size,
      required this.color,
      required this.icon,
      required this.text});
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Center(
        child: Container(
          height: 57,
          width: 290,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: color, //parameter
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(children: [
            Padding(padding: EdgeInsets.all(10)),
            Icon(
              icon,
              size: 30,
              color: Colors.white,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              text,
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ]),
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class textfilledstyle extends StatelessWidget {
  //final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: TextFormField(
        cursorColor: Colors.green,
        // controller: passwordController,
        keyboardType: TextInputType.visiblePassword,
        obscureText: true,
        onFieldSubmitted: (String value) {
          print(value);
        },
        onChanged: (String value) {
          print(value);
        },
        decoration: InputDecoration(
          // labelText: Text,

          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 2, color: Colors.green),
            borderRadius: BorderRadius.circular(10),
          ),

          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 2, color: Colors.green),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        cursorHeight: 1,
        showCursor: true,
      ),
    );
  }
}

class text_style extends StatelessWidget {
  //final IconData icon;
  final String text;
  const text_style({required this.text});
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 2.0, left: 3),
      child: Text(
        text,
        style: TextStyle(
            fontSize: 15,
            fontFamily: 'Raleway',
            color: Colors.black,
            fontWeight: FontWeight.w400),
      ),
    );
  }
}

class line_style extends StatelessWidget {
  //final IconData icon;
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Row(
        children: [
          Expanded(
            child: Divider(
              thickness: 2,
              endIndent: 10.0,
            ),
          ),
          Text(
            "Or Continue With ",
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Divider(
              thickness: 1,
              endIndent: 10.0,
            ),
          ),
        ],
      ),
    );
  }
}

class method_log_in extends StatelessWidget {
  //final IconData icon;
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            //  padding: EdgeInsets.zero,
            //constraints: BoxConstraints(),
            iconSize: 40,
            icon: Image.asset('assets/Google.png'), onPressed: () {},
          ),
          IconButton(
            onPressed: () {},
            //  padding: EdgeInsets.zero,
            //constraints: BoxConstraints(),
            iconSize: 70,
            icon: Image.asset('assets/facebook.png'),
          ),
        ],
      ),
    );
  }
}
