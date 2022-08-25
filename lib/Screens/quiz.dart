import 'package:flutter/material.dart';

class qiz extends StatefulWidget {
  @override
  State<qiz> createState() => _qizState();
}

class _qizState extends State<qiz> {
  Text text = Text(
    "1",
    style: TextStyle(color: Colors.green, fontSize: 30),
  );
  int s = 1;
  String? gender; //no radio button will be selected
  //String gender = "male"; //if you want to set default value
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                "Course Exam",
                style: TextStyle(color: Colors.black, fontSize: 30),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Question ${s}/10",
              style: TextStyle(color: Colors.black, fontSize: 40),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "What is the user experience?",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(
              height: 14,
            ),
            Container(
              child: RadioListTile(
                // activeColor: Colors.green,
                //  selectedTileColor: Colors.green,
                title: Text(
                    "The user experience is how the developer feels about a user."),
                value: "m",
                groupValue: gender,
                onChanged: (value) {
                  setState(() {
                    gender = value.toString();
                  });
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            RadioListTile(
              title: Text(
                  "The user experience is how the user feels about interacting with or experiencing aproduct."),
              value: "e",
              groupValue: gender,
              onChanged: (value) {
                setState(() {
                  gender = value.toString();
                });
              },
            ),
            SizedBox(
              height: 10,
            ),
            RadioListTile(
              title: Text(
                  "The user experience is the attitude the UX designer has about a product."),
              value: "f",
              groupValue: gender,
              onChanged: (value) {
                setState(() {
                  gender = value.toString();
                });
              },
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 120),
              child: Container(
                width: 120,

                height: 50,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: MaterialButton(
                  onPressed: () {
                    //  print(emailController.text);
                    // print(passwordController.text);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => qiz()),
                    );
                  },
                  child: Text(
                    'Next',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                //  decoration: ,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
