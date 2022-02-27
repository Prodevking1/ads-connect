import 'package:main_app/ressources/themes.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 15.0, top: 25.0),
          child: Row(
            children: const <Widget>[
              Icon(Icons.arrow_back_ios_new_outlined),
            ],
          ),
        )
      ],
    ));
  }
}
