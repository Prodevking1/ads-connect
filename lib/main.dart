import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:main_app/pages/home_page.dart';
import 'package:main_app/ressources/themes.dart';
import 'package:main_app/pages/signup_page.dart';
import 'package:main_app/pages/login_page.dart';
import 'package:main_app/pages/intro_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Arial'),
      home: const IntroScreen(
        title: '',
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
