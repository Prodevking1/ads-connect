import 'dart:ui';

import 'package:main_app/pages/login_page.dart';
import 'package:main_app/ressources/themes.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _Home();
}

late bool selectedItem1 = false;
late bool selectedItem2 = false;
late bool selectedItem3 = true;

Color toogleItemColor(selectedItem) {
  if (selectedItem) {
    return colorBlue;
  } else {
    return Colors.grey;
  }
}

class _Home extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.blue,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 44.0),
            Padding(
              padding: const EdgeInsets.fromLTRB(5.00, 30.0, 30.0, 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.menu_outlined,
                      color: colorWhite,
                      size: 50.0,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.notification_important_outlined,
                      color: colorWhite,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: Text('AdsConnect',
                  style: TextStyle(
                      fontFamily: 'Ubuntu',
                      fontSize: 22.0,
                      fontWeight: FontWeight.w700,
                      color: Colors.red)),
            ),
            Stack(
              children: <Widget>[
                Center(
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    margin: const EdgeInsets.only(top: 40.0),
                    elevation: 40.0,
                    child: SizedBox(
                      width: 350.0,
                      height: 150.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            width: 270.0,
                            child: Padding(
                              padding: const EdgeInsets.all(2),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            Text(
              'Bienvenue  Murray',
              style: StyledUbuntu2,
            ),
            Padding(
              padding: EdgeInsets.only(top: size.height * 0.26),
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                        top: size.height * 0.003, left: size.height * 0.196),
                    child: SizedBox(
                      width: size.width * 0.22,
                      child: FittedBox(
                        child: FloatingActionButton(
                          backgroundColor: colorWhite,
                          onPressed: () {
                            setState(() {
                              selectedItem1 = false;
                              selectedItem2 = false;
                              selectedItem3 = !selectedItem3;
                            });
                          },
                          child: Icon(
                            Icons.search_outlined,
                            color: toogleItemColor(selectedItem3),
                            size: selectedItem3 ? 30.0 : 20.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: size.height * 0.064),
                    child: CustomPaint(
                      size: Size(size.width, 100),
                      painter: CustomPainterNav(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40.0, top: 65),
                    child: MaterialButton(
                      shape: const CircleBorder(),
                      onPressed: () {
                        setState(() {
                          selectedItem1 = !selectedItem1;
                          selectedItem2 = false;
                          selectedItem3 = false;
                        });
                      },
                      child: Icon(
                        Icons.contact_page_outlined,
                        size: selectedItem1 ? 70 : 50.0,
                        color: toogleItemColor(selectedItem1),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: size.width * 0.7, top: 65),
                    child: MaterialButton(
                      shape: const CircleBorder(),
                      onPressed: () {
                        setState(() {
                          selectedItem1 = false;
                          selectedItem2 = !selectedItem2;
                          selectedItem3 = false;
                        });
                      },
                      child: Icon(
                        Icons.mail_outline_sharp,
                        size: selectedItem2 ? 70 : 50,
                        color: toogleItemColor(selectedItem2),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomPainterNav extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = colorWhite
      ..style = PaintingStyle.fill;

    Path path = Path()
      ..moveTo(0, 35)
      ..quadraticBezierTo(0, 0, size.width * 0.125, 00)
      ..lineTo(size.width * 0.300, 00)
      ..quadraticBezierTo(size.width * 0.375, 00, size.width * 0.385, 20)
      ..arcToPoint(Offset(size.width * 0.615, 20),
          radius: const Radius.circular(50.0), clockwise: false)
      ..quadraticBezierTo(size.width * 0.625, 00, size.width * 0.70, 00)
      ..lineTo(size.width * 0.875, 00)
      ..quadraticBezierTo(size.width, 00, size.width, 35)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
