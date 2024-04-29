// ignore: unused_import
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:pfe/features/signup/signup_screen.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void _submitForm() {
    if (formKey.currentState!.validate()) {
      ScaffoldMessenger.of(formKey.currentContext!)
          .showSnackBar(const SnackBar(content: Text('Login Successfully')));
    }
  }

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  String? _validateEmail(value) {
    if (value!.isEmpty) {
      return 'Veuillez entrer un email';
    }

    return null;
  }

  String? _validatePassword(value) {
    if (value!.isEmpty) {
      return 'Veuillez entrer un mot de passe';
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 5, 5, 204),
        ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.only(top: 150, right: 20, left: 20),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                SizedBox(
                    width: 220.w,
                    child: const Text(
                      "se connecter",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    )),
                const SizedBox(
                  height: 35.0,
                ),
                const SizedBox(
                  height: 25.0,
                ),
                TextFormField(
                    controller: email,
                    keyboardType: TextInputType.emailAddress,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: _buildInputDecoration("Email", Icons.email),
                    validator: _validateEmail),
                const SizedBox(
                  height: 25.0,
                ),
                const SizedBox(
                  height: 25.0,
                ),
                TextFormField(
                    controller: password,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    obscureText: true,
                    decoration: _buildInputDecoration("Password", Icons.lock),
                    validator: _validatePassword),
                SizedBox(
                  height: 25.0.h,
                ),
                SizedBox(
                  height: 25.0.h,
                ),
                SizedBox(
                    height: 50,
                    width: 150,
                    child: ElevatedButton(
                        onPressed: () async {
                          //Envoyer nos informations à la base des données
                          try {
                            print("email is");
                            print(email.text);
                            print("password is");
                            print(password.text);

                            final credential = await FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                                    email: email.text, password: password.text);
                            // ignore: use_build_context_synchronously
                            Navigator.of(context)
                                .pushReplacementNamed("home_screen");
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'user-not-found') {
                              print('No user found for that email.');
                            } else if (e.code == 'wrong-password') {
                              print('Wrong password provided for that user.');
                            }
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 5, 5, 204)),
                        child: const Text(
                          "se connecter",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ))),
                SizedBox(height: 30.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Si n'ai pas un compte ? ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignupScreen()));
                        },
                        child: const Text("S'inscrire",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black))),
                  ],
                ),
              ],
            ),
          ),
        ));
  }

  InputDecoration _buildInputDecoration(String label, IconData suffixIcon) {
    return InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(color: Color.fromARGB(255, 124, 137, 136)),
            borderRadius: BorderRadius.circular(30.0)),
        filled: true,
        labelText: label,
        suffixIcon: Icon(
          suffixIcon,
          color: Colors.black,
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0)));
  }
}
