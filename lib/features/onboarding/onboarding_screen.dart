// ignore: unused_import
import 'package:flutter/material.dart';
import 'package:pfe/features/login/login_screen.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: PageView(
          children: [
            Column(children: [
              const SizedBox(height: 300),
              Image.asset("assets/images/logo2.png"),
              Container(
                margin: const EdgeInsets.only(top: 60),
                child: RichText(
                    text: const TextSpan(children: [
                  TextSpan(
                      text: "Compagne d'email marketing en Tunisie",
                      style: TextStyle(
                          color: Color.fromARGB(255, 58, 57, 57),
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          wordSpacing: 4))
                ])),
              ),
              const SizedBox(
                height: 90,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                      height: 40,
                      width: 100,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()));
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 49, 23, 214)),
                          child: const Text(
                            "Suivant",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ))),
                ),
              )
            ])
          ],
        ));
  }
}
