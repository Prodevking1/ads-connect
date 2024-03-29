import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:main_app/ressources/themes.dart';
import 'package:main_app/pages/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class SingnupPage extends StatefulWidget {
  SingnupPage({Key? key}) : super(key: key);
  bool visibilityPassword = false;

  @override
  State<SingnupPage> createState() => _SingnupPageState();

  void onSubmit(String name) {}
}

class _SingnupPageState extends State<SingnupPage> {
  TextEditingController lastnameController = TextEditingController();
  TextEditingController firstnameController = TextEditingController();
  TextEditingController userController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool passwordVisibility = false;

  get status => null;

  void tooglePassword() {
    setState(() {
      passwordVisibility = !passwordVisibility;
    });
  }

  final _formKey = GlobalKey<FormState>();

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  DatabaseReference dbRef = FirebaseDatabase.instance.ref().child("Users");

  @override
  void dispose() {
    super.dispose();
    lastnameController.dispose();
    firstnameController.dispose();
    userController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 30.0,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 0),
                child: Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 40.0,
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              color: textWhiteGrey,
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            child: TextFormField(
                              validator: (text) {
                                if (text == null ||
                                    text.isEmpty ||
                                    text.length < 2) {
                                  return 'Nom invalide';
                                }
                                return null;
                              },
                              controller: lastnameController,
                              keyboardType: TextInputType.name,
                              style: const TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(
                                    borderSide: BorderSide.none),
                                hintText: "Nom",
                                hintStyle: heading6.copyWith(color: textGrey),
                                prefixIcon: const Icon(
                                  Icons.person_add_alt_1_outlined,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 30.0,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: textWhiteGrey,
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            child: TextFormField(
                              validator: (text) {
                                if (text == null ||
                                    text.isEmpty ||
                                    text.length < 2) {
                                  return 'Prénom invalide';
                                }
                                return null;
                              },
                              controller: firstnameController,
                              keyboardType: TextInputType.name,
                              style: const TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(
                                    borderSide: BorderSide.none),
                                hintText: "Prenom",
                                hintStyle: heading6.copyWith(color: textGrey),
                                prefixIcon: const Icon(
                                  Icons.person_add_alt_1_outlined,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 30.0,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: textWhiteGrey,
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            child: TextFormField(
                              validator: (text) {
                                if (text == null ||
                                    text.isEmpty ||
                                    text.length < 2) {
                                  return 'E-mail invalide';
                                }
                                if (!RegExp(
                                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(text)) {
                                  return 'E-mail invalide';
                                }

                                return null;
                              },
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                              style: const TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(
                                    borderSide: BorderSide.none),
                                hintText: "E-mail",
                                hintStyle: heading6.copyWith(color: textGrey),
                                prefixIcon: const Icon(
                                  Icons.email_outlined,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 30.0,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: textWhiteGrey,
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            child: TextFormField(
                              validator: (text) {
                                if (text == null ||
                                    text.isEmpty ||
                                    text.length < 2) {
                                  return ' User invalide';
                                }
                                return null;
                              },
                              controller: userController,
                              keyboardType: TextInputType.name,
                              style: const TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(
                                    borderSide: BorderSide.none),
                                hintText: "Nom d'utilisateur",
                                hintStyle: heading6.copyWith(color: textGrey),
                                prefixIcon: const Icon(
                                  Icons.person_add_alt,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 30.0,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: textWhiteGrey,
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            child: TextFormField(
                              keyboardType: TextInputType.phone,
                              validator: (text) {
                                if (text == null ||
                                    text.isEmpty ||
                                    text.length != 8) {
                                  return ' Téléphone invalide';
                                }
                                return null;
                              },
                              controller: phoneController,
                              style: const TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(
                                    borderSide: BorderSide.none),
                                hintText: "Téléphone",
                                hintStyle: heading6.copyWith(color: textGrey),
                                prefixIcon: const Icon(
                                  Icons.phone_android_outlined,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 30.0,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: textWhiteGrey,
                              borderRadius: BorderRadius.circular(60.0),
                            ),
                            child: TextFormField(
                              validator: (text) {
                                if (text == null ||
                                    text.isEmpty ||
                                    text.length < 6) {
                                  return 'Trop court';
                                }
                                return null;
                              },
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
                                prefixIcon: Icon(Icons.vpn_key_rounded,
                                    color: textGrey),
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
                            height: 30.0,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: textWhiteGrey,
                              borderRadius: BorderRadius.circular(60.0),
                            ),
                            child: TextFormField(
                              controller: confirmPasswordController,
                              validator: (text) {
                                if (passwordController.text !=
                                    confirmPasswordController.text) {
                                  return 'les mots de passe ne correspondent pas';
                                }
                                return null;
                              },
                              style: const TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                              obscureText: !passwordVisibility,
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(
                                    borderSide: BorderSide.none),
                                hintText: "Confirmer le mot de passe",
                                hintStyle: heading6.copyWith(color: textGrey),
                                prefixIcon: Icon(Icons.vpn_key_rounded,
                                    color: textGrey),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 50.0,
                          ),
                          Container(
                            height: 56.0,
                            decoration: BoxDecoration(
                              color: textWhiteGrey,
                              borderRadius: BorderRadius.circular(60.0),
                            ),
                            child: Material(
                              elevation: 12.0,
                              borderRadius: BorderRadius.circular(30.0),
                              color: Colors.blue.shade500,
                              child: TextButton(
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    registerUser();
                                  }
                                },
                                child: Center(
                                  child: Text(
                                    "Créer mon compte",
                                    style:
                                        heading5.copyWith(color: Colors.white),
                                  ),
                                ),
                              ),
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
      ),
    );
  }

  void registerUser() {
    firebaseAuth
        .createUserWithEmailAndPassword(
            email: emailController.text, password: passwordController.text)
        .then((result) {
      dbRef.child(result.user!.uid).set({
        "lastName": lastnameController.text,
        "firstName": firstnameController.text,
        "user": userController.text,
        "email": emailController.text,
        "phone": phoneController.text,
      }).then((res) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Home(uid: result.user!.uid)),
        );
      });
    }).catchError((error) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
                title: Text('Erreur'),
                content: Text(error.message),
                actions: [
                  TextButton(
                    child: Text("Ok"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ]);
          });
    });
  }
}
