import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:main_app/pages/login_page.dart';
import 'package:main_app/ressources/themes.dart';
import 'package:main_app/pages/client_home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class SingnupPage extends StatefulWidget {
  SingnupPage({Key? key}) : super(key: key);

  @override
  State<SingnupPage> createState() => _SingnupPageState();
}

class _SingnupPageState extends State<SingnupPage> {
  TextEditingController lastnameController = TextEditingController();
  TextEditingController firstnameController = TextEditingController();
  late TextEditingController userController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool passwordVisibility = false;
  var loading = false;
  var errorMessage;
  Map roles = {
    'client': 0,
    'designer': 1,
    'influenceur': 2,
  };
  var role_user;
  int? radioSelected = 0;

  void tooglePassword() {
    setState(() {
      passwordVisibility = !passwordVisibility;
    });
  }

  final _formKey = GlobalKey<FormState>();

  FirebaseAuth firebase_auth = FirebaseAuth.instance;
  FirebaseFirestore firebase_store = FirebaseFirestore.instance;

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
                            height: 10.0,
                          ),
                          Column(
                            children: <Widget>[radioRow()],
                          ),
                          const SizedBox(
                            height: 25.0,
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
                                    _onLoading();
                                    _SignUp();
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

  // Enregister un utilisateur
  Future _SignUp() async {
    setState(() {
      loading = true;
    });
    try {
      await firebase_auth.createUserWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);

      await firebase_store.collection('Users').add({
        'nom': firstnameController.text,
        'prenom': lastnameController.text,
        'email': emailController.text,
        'username': userController.text,
        'role': role_user,
        'tel': phoneController.text,
      });

      await showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: const Text('Fellicitations'),
                content: const Text(
                    'Compte cree avec succes. Vous pouvez vous connecter maintenant.'),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const LoginPage(title: '')));
                      },
                      child: const Text("D'accord"))
                ],
              ));
    } on FirebaseAuthException catch (e) {
      _handleSignUpError(e);
      setState(() {
        loading = false;
      });
    }
  }

  // Erreurs lors de la creation du compte
  void _handleSignUpError(FirebaseAuthException e) {
    switch (e.code) {
      case 'email-already-in-use':
        errorMessage =
            "L'adresse e-mail fournie est déjà utilisée par un utilisateur existant.";
        break;
      case 'phone-number-already-exists':
        errorMessage =
            "Le numero de telephone fourni est déjà utilisée par un utilisateur existant.";
        break;
      case 'network-request-failed':
        errorMessage = "Verifier votre connexion internet.";
        break;
      default:
        errorMessage = "Une erreur s'est produite";
    }

    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text('Erreur'),
              content: Text(errorMessage),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text("D'accord"))
              ],
            ));
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
              Text('Inscription en cours...'),
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

  // gestion type utilisateur
  Row radioRow() {
    List<Widget> l = [];
    roles.forEach((value, key) {
      Column colonne = Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Radio(
            value: key,
            groupValue: radioSelected,
            onChanged: (dynamic i) {
              setState(() {
                radioSelected = i;
              });
              role_user = value;
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                value,
              )
            ],
          ),
        ],
      );
      l.add(colonne);
    });
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: l);
  }

  // Verifier si l'utilisateur existe
  userExists(String username) async {
    try {
      await firebase_store
          .collection("users")
          .where('username', isEqualTo: username)
          .get()
          .then((value) => value.size > 0 ? true : false);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
