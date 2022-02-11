import 'dart:ui';

import 'package:main_app/pages/login_page.dart';
import 'package:main_app/ressources/themes.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key, required uid}) : super(key: key);

  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            opacity: 0.3,
            image: AssetImage('assets/images/home.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: <Widget>[
            const SizedBox(height: 50.0),
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 30.0, 30.0, 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Icon(
                    Icons.menu_outlined,
                    color: colorBlue,
                    size: 42.0,
                  ),
                  Icon(Icons.notifications_outlined,
                      color: colorBlue, size: 40.0),
                ],
              ),
            ),
            const Center(
              child: Text('AdsConnect',
                  style: TextStyle(
                      fontFamily: 'Ubuntu',
                      fontSize: 22.0,
                      fontWeight: FontWeight.w700,
                      color: Colors.red)),
            ),
            const SizedBox(height: 20.0),
            Card(
              elevation: 10.0,
              child: SizedBox(
                width: 350.0,
                height: 70.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      width: 270.0,
                      child: Padding(
                        padding: const EdgeInsets.all(2),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              children: const <Widget>[
                                Icon(
                                  Icons.circle,
                                  color: Colors.green,
                                  size: 12.0,
                                ),
                                Text(
                                  '13',
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Column(
                              children: const <Widget>[
                                Icon(
                                  Icons.circle,
                                  color: Colors.green,
                                  size: 12.0,
                                ),
                                Text(
                                  '37',
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Column(
                              children: const <Widget>[
                                Icon(
                                  Icons.circle,
                                  color: Colors.green,
                                  size: 12.0,
                                ),
                                Text(
                                  '131',
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 5.0),
                    SizedBox(
                      width: 300.0,
                      child: Padding(
                        padding: const EdgeInsets.all(2),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const <Widget>[
                            Text(
                              'Contrats',
                            ),
                            Text('Designers'),
                            Text('Influenceurs'),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            ClipPath(
              clipper: MyClipper(),
              child: Container(
                height: 380,
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomLeft,
                      colors: [Color(0XFF11249F), Color(0XFF3383CD)]),
                ),
                child: Column(
                  children: <Widget>[
                    const SizedBox(height: 45.0),
                    Expanded(
                      child: Stack(
                        children: const <Widget>[],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
