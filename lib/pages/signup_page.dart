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
    });
    if (status == AuthResultStatus.successful) {
      // Navigate to success page
    } else {
      final errorMsg = AuthExceptionHandler.generateExceptionMessage(status);
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Erreur"),
              content: Text(errorMsg),
              actions: [
                TextButton(
                  child: const Text("Ok"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          });
    } /* .catchError((error) {
      switch (error.code) {
        case 'auth/email-already-in-use':
          var errorMessage = 'Adresse e-mail en cours d\'utilisation';
      }
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Erreur"),
              content: Text(error.message),
              actions: [
                TextButton(
                  child: const Text("Ok"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          });
    }); */
  }
}

class AuthExceptionHandler {
  static handleException(e) {
    print(e.code);
    AuthResultStatus status;
    switch (e.code) {
      case "ERROR_INVALID_EMAIL":
        status = AuthResultStatus.invalidEmail;
        break;
      case "ERROR_WRONG_PASSWORD":
        status = AuthResultStatus.wrongPassword;
        break;
      case "ERROR_USER_NOT_FOUND":
        status = AuthResultStatus.userNotFound;
        break;
      case "ERROR_USER_DISABLED":
        status = AuthResultStatus.userDisabled;
        break;
      case "ERROR_TOO_MANY_REQUESTS":
        status = AuthResultStatus.tooManyRequests;
        break;
      case "ERROR_OPERATION_NOT_ALLOWED":
        status = AuthResultStatus.operationNotAllowed;
        break;
      case "ERROR_EMAIL_ALREADY_IN_USE":
        status = AuthResultStatus.emailAlreadyExists;
        break;
      default:
        status = AuthResultStatus.undefined;
    }
    return status;
  }

  static generateExceptionMessage(exceptionCode) {
    String errorMessage;
    switch (exceptionCode) {
      case AuthResultStatus.invalidEmail:
        errorMessage = "Adresee e-mail invalide";
        break;
      case AuthResultStatus.wrongPassword:
        errorMessage = "Mot de passe incorrect.";
        break;
      case AuthResultStatus.userNotFound:
        errorMessage = "Adresse e-mail non existant";
        break;
      case AuthResultStatus.userDisabled:
        errorMessage = "Utilisateur suspendu";
        break;
      case AuthResultStatus.tooManyRequests:
        errorMessage = "Trop de requetes. Veuillez réessayer.";
        break;
      case AuthResultStatus.operationNotAllowed:
        errorMessage = "Signing in with Email and Password is not enabled.";
        break;
      case AuthResultStatus.emailAlreadyExists:
        errorMessage = "Adresse e-mail deja utilisé.";
        break;
      default:
        errorMessage = "Un erreur s'est produite.";
    }

    return errorMessage;
  }
}

class FirebaseAuthHelper {
  final _auth = FirebaseAuth.instance;
  late AuthResultStatus _status;

  ///
  /// Helper Functions
  ///
  Future<AuthResultStatus> createAccount({email, pass}) async {
    try {
      final authResult = await _auth.createUserWithEmailAndPassword(
          email: email, password: pass);
      if (authResult.user != null) {
        _status = AuthResultStatus.successful;
      } else {
        _status = AuthResultStatus.undefined;
      }
    } catch (e) {
      print('Exception @createAccount: $e');
      _status = AuthExceptionHandler.handleException(e);
    }
    return _status;
  }

  Future<AuthResultStatus> login({email, pass}) async {
    try {
      final authResult =
          await _auth.signInWithEmailAndPassword(email: email, password: pass);

      if (authResult.user != null) {
        _status = AuthResultStatus.successful;
      } else {
        _status = AuthResultStatus.undefined;
      }
    } catch (e) {
      print('Exception @createAccount: $e');
      _status = AuthExceptionHandler.handleException(e);
    }
    return _status;
  }

  logout() {
    _auth.signOut();
  }
}

enum AuthResultStatus {
  successful,
  emailAlreadyExists,
  wrongPassword,
  invalidEmail,
  userNotFound,
  userDisabled,
  operationNotAllowed,
  tooManyRequests,
  undefined,
}
