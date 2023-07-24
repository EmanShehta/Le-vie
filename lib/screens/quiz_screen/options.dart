import 'package:flutter/material.dart';
import 'package:la_vie/shared/components/styles/colors.dart';
import 'package:la_vie/utils/size_extention.dart';

enum SingingCharacter { ans1, ans2,ans3 }

class OptionsWidget extends StatefulWidget {
  int groupVal=0;

  OptionsWidget({Key? key}) : super(key: key);


  @override
  State<OptionsWidget> createState() => _OptionsWidgetState();
}

class _OptionsWidgetState extends State<OptionsWidget> {
  SingingCharacter? _character = SingingCharacter.ans2;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.zero,
          margin: EdgeInsets.symmetric(vertical: 20.rh),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            border: Border.all(
              width: 1.rSp,
              color: defaultColor,
            ),

          ),
          child: ListTile(
            title: const Text('The user experience is how the developer feels about a user',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                fontFamily: 'Roboto',
              ),
            ),
            trailing: Transform.scale(
              scale: 1.3,
              child: Radio<SingingCharacter>(
                activeColor: defaultColor,
                splashRadius: 1,

                value: SingingCharacter.ans1,
                groupValue: _character,
                onChanged: (SingingCharacter? value) {
                  setState(() {
                    _character = value;
                  });
                },
              ),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.zero,

          margin: EdgeInsets.symmetric(vertical: 20.rh),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              border: Border.all(
                width: 1.rSp,
                color: defaultColor,
              )

          ),
          child: ListTile(
            title: const Text('The user experience is how the user feels about interacting with or experiencing a product',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              fontFamily: 'Roboto',
            ),
            ),
            trailing: Transform.scale(
              scale: 1.3,
              child: Radio<SingingCharacter>(
                activeColor: defaultColor,
                splashRadius: 1,

                value: SingingCharacter.ans2,
                groupValue: _character,
                onChanged: (SingingCharacter? value) {
                  setState(() {
                    _character = value;
                  });
                },
              ),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.zero,
          margin: EdgeInsets.symmetric(vertical: 20.rh),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              border: Border.all(
                width: 1.rSp,
                color: defaultColor,
              )

          ),
          child: ListTile(
            title: const Text('The user experience is the attitude the UX designer has about a product.',

              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                fontFamily: 'Roboto',
              ),
            ),
            trailing: Transform.scale(
              scale: 1.3,
              child: Radio<SingingCharacter>(
                activeColor: defaultColor,
                splashRadius: 1,

                value: SingingCharacter.ans3,
                groupValue: _character,
                onChanged: (SingingCharacter? value) {
                  setState(() {
                    _character = value;
                  });
                },
              ),
            ),
          ),
        ),

      ],
    );
  }
}