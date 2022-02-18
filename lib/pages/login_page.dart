import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:main_app/ressources/themes.dart';
import 'package:main_app/pages/signup_page.dart';
import 'package:main_app/pages/forgot_password.dart';
import 'package:main_app/pages/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController userController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool passwordVisibility = false;
  var loading;
  var errorMessage;
  final _keyForm = GlobalKey<FormState>();

  FirebaseAuth firebase_auth = FirebaseAuth.instance;
  FirebaseFirestore firebase_store = FirebaseFirestore.instance;

  get uid => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        key: _keyForm,
        child: Column(
          children: <Widget>[
            Column(
              children: <Widget>[
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
                            children: <Widget>[
                              SvgPicture.asset(
                                'assets/images/login.svg',
                                width: 310.0,
                                fit: BoxFit.fitWidth,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 0),
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 40.0,
                  ),
                  Form(
                    child: Column(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            color: textWhiteGrey,
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          child: TextFormField(
                            controller: emailController,
                            style: const TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                            decoration: InputDecoration(
                                border: const OutlineInputBorder(
                                    borderSide: BorderSide.none),
                                hintText: "Adresse E-mail",
                                hintStyle: heading6.copyWith(color: textGrey),
                                prefixIcon: const Icon(
                                  Icons.account_circle,
                                  color: Colors.grey,
                                )),
                          ),
                        ),
                        const SizedBox(
                          height: 24.0,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: textWhiteGrey,
                            borderRadius: BorderRadius.circular(60.0),
                          ),
                          child: TextFormField(
                            controller: passwordController,
                            style: const TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                            obscureText: !passwordVisibility,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(
                                  borderSide: BorderSide.none),
                              hintText: "Mot de passe",
                              hintStyle: heading6.copyWith(color: textGrey),
                              prefixIcon:
                                  Icon(Icons.vpn_key_rounded, color: textGrey),
                              suffixIcon: IconButton(
                                icon: Icon(
                                    passwordVisibility
                                        // ignore: dead_code
                                        ? Icons.visibility_outlined
                                        : Icons.visibility_off_outlined,
                                    color: passwordVisibility
                                        ? textGrey
                                        : textBlack),
                                onPressed: tooglePassword,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SingnupPage()));
                              },
                              child: const Text(
                                "Mot de passe oublié ?",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 24.0,
                        ),
                        Container(
                          height: 56.0,
                          decoration: BoxDecoration(
                            color: textWhiteGrey,
                            borderRadius: BorderRadius.circular(60.0),
                          ),
                          child: Material(
                            elevation: 12.0,
                            borderRadius: BorderRadius.circular(24.0),
                            color: Colors.blue.shade500,
                            child: TextButton(
                              onPressed: () async {
                                _onLoading();
                                _singnIn();
                              },
                              child: Center(
                                child: Text(
                                  "Me connecter",
                                  style: heading5.copyWith(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 55.0),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SingnupPage()));
                          },
                          child: const Text(
                            "Créer un compte",
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.w700,
                                fontSize: 16.0),
                          ),
                        ),
                      ],
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

  // fonctions
  void tooglePassword() {
    setState(() {
      passwordVisibility = !passwordVisibility;
    });
  }

  // Connecter un utilisateur
  Future _singnIn() async {
    setState(() {
      loading = true;
    });
    try {
      await firebase_auth.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      await Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const Home()));
    } on FirebaseAuthException catch (e) {
      _handleSignInError(e);
      setState(() {
        loading = false;
      });
    }
  }

  // erreurs lors de la connexion
  _handleSignInError(FirebaseAuthException e) {
    switch (e.code) {
      case 'invalid-email':
        errorMessage = 'Adresse e-mail non valide';
        break;
      case 'user-disabled':
        errorMessage = 'Cet compte a ete desactive';
        break;
      case 'user-not-found':
        errorMessage = 'Adresse e-mail ou mot de passe invalide';
        break;
      case 'network-request-failed':
        errorMessage = "Verifier votre connexion internet.";
        break;
      case 'wrong-password':
        errorMessage = "Adresse e-mail ou mot de passe invalide";
        break;
      default:
        errorMessage = "Adresse e-mail ou mot de passe invalide";
    }
    showDialog(
      context: context,
      builder: (context) => Container(
        child: AlertDialog(
          title: const Text('Erreur'),
          content: Text(errorMessage),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("D'accord"))
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
        ),
      ),
    );
    print(errorMessage);
  }

  // popup chargement
  void _onLoading() {
    BuildContext? dialogContext;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const <Widget>[
              CircularProgressIndicator(),
              SizedBox(
                width: 10.0,
              ),
              Text('Connexion en cours...'),
            ],
          ),
        );
      },
    );
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pop(context);
      Navigator.pop(context, dialogContext);
    });
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
