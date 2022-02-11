import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:main_app/pages/home_page.dart';
import 'package:main_app/ressources/themes.dart';
import 'package:main_app/pages/login_page.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key, required String title}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _IntroScreen();
  }
}

class _IntroScreen extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    PageDecoration pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(
          fontSize: 28.0,
          fontWeight: FontWeight.w700,
          fontFamily: 'Ubuntu',
          color: Colors.blue),
      bodyTextStyle: TextStyle(
        fontSize: 19.0,
        color: Colors.black,
        fontFamily: 'Ubuntu',
        fontWeight: FontWeight.w500,
      ),
      descriptionPadding: EdgeInsets.only(top: 130.0),
      imagePadding: EdgeInsets.only(top: 50.0),
      boxDecoration: BoxDecoration(
          /* gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          stops: [0.1, 0.5, 0.7, 0.9],
          colors: [
            Colors.blueAccent,
            Colors.white,
            Colors.blue,
            Colors.white12,
          ],
        ), */
          ),
    );
    return IntroductionScreen(
      globalBackgroundColor: Colors.white,
      pages: [
        PageViewModel(
          title: "Visuels publicitaires",
          body:
              "Faites concevoir vos affiches, flyers, et autres visuels de qualité par nos experts designers.",
          image: introImage('assets/images/designers.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Influenceurs",
          body:
              "Accorder plus d'audience a vos visuels grâce a nos web influenceurs.",
          image: introImage('assets/images/influenceurs.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Booster vos ventes",
          body: "Augmenter votre chiffre d'affaire avec AdsConnect",
          image: introImage('assets/images/social.png'),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => goHomepage(context),
      onSkip: () => goHomepage(context),
      showSkipButton: true,
      skipFlex: 0,
      nextFlex: 0,
      skip: const Text(
        'Ignorer',
        style: TextStyle(
          color: Colors.blue,
          fontSize: 14.0,
          fontWeight: FontWeight.w600,
        ),
      ),
      next: const Icon(
        Icons.arrow_forward,
        color: Colors.blue,
      ),
      done: Text(
        'Commencer',
        style: TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.w600,
          color: colorBlue,
        ),
      ),
      dotsDecorator: DotsDecorator(
        size: const Size(10.0, 10.0),
        color: colorBlack,
        activeSize: const Size(22.0, 10.0),
        activeShape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }

  void goHomepage(context) {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) {
      return const LoginPage(
        title: '',
      );
    }), (Route<dynamic> route) => false);
  }

  Widget introImage(String assetName) {
    return Align(
      child: Image.asset(assetName, width: 350.0),
      alignment: Alignment.bottomCenter,
    );
  }

  Padding padding() {
    return const Padding(padding: EdgeInsets.all(10));
  }
}
