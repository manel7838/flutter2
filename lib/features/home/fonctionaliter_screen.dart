import 'package:flutter/material.dart';
//import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pfe/config/constants.dart';

class FonctionaliterScreen extends StatefulWidget {
  const FonctionaliterScreen({super.key});

  @override
  State<FonctionaliterScreen> createState() => _FonctionaliterScreenState();
}

class _FonctionaliterScreenState extends State<FonctionaliterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 21, 38, 229),
      ),
      body: (ListView(
        children: [
          const Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              "Quels sont les principales problématiques rencontrées lors de l'e-mailing ?",
              style: TextStyle(
                  color: Color.fromARGB(255, 219, 52, 52), fontSize: 20),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: RichText(
              text: TextSpan(
                  text: ' 1. Bonne réception des mails :',
                  style: kEncodeSansBold.copyWith(
                      color: const Color.fromARGB(255, 186, 37, 37),
                      fontSize: 15),
                  children: [
                    TextSpan(
                      text:
                          "                                                           Pour qu'un e-mailing soit réussi il faut déjà que vos destintaire reçoivent vos mails et pas dans leurs dossier Spam sinon il y a peu de chance qu'ils soient lus.Pour cela il faut disposer d'une base de contacts fiable et mis à jour maispas seulement.",
                      style: kEncodeSansMedium.copyWith(
                          color: const Color.fromARGB(255, 0, 0, 0),
                          fontSize: 15),
                    ),
                    TextSpan(
                      text:
                          "                                                                    2. Qualité d'affichage des mails : ",
                      style: kEncodeSansBold.copyWith(
                          color: const Color.fromARGB(255, 186, 37, 37),
                          fontSize: 15),
                    ),
                    TextSpan(
                      text:
                          "                                                Pour séduire rapidement , un mail doit contenir des visuels pertuants. Mais n'avez-vous jamais reçu des mails qui s'affichent mal, dont les images sont complétement décalées et qui passent donc pour du travail d'amateur? En effet, l'affichage d'un email peut etre complément différent d'une application à l'autre(OUTLOOK,GMAIL...)",
                      style: kEncodeSansMedium.copyWith(
                          color: const Color.fromARGB(255, 15, 15, 15),
                          fontSize: 15),
                    ),
                    TextSpan(
                      text:
                          "                                     3. Fiabilité des statistiques : ",
                      style: kEncodeSansBold.copyWith(
                          color: const Color.fromARGB(255, 186, 37, 37),
                          fontSize: 15),
                    ),
                    TextSpan(
                      text:
                          "                                                 Les statistiques des retours lors d'un e-mailing sont essentielles.Sans statistiques, il es difficiles de comprendre comment a été peçu son mailing et donc comment améliorer  les prochains ",
                      style: kEncodeSansMedium.copyWith(
                          color: const Color.fromARGB(255, 11, 9, 9),
                          fontSize: 15),
                    ),
                  ]),
            ),
          ),
          Image.asset(
            "assets/images/ss.jpg",
            height: 300,
            width: 300,
          ),
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              "Pourquoi Mailwizz ?",
              style: TextStyle(
                  color: Color.fromARGB(255, 219, 52, 52), fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Facile à crée        Facile à utiliser       Envoi rapide       Rapports complets",
              style: TextStyle(
                  color: Color.fromARGB(255, 92, 90, 90),
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
              textAlign: TextAlign.center,
            ),
          )
        ],
      )),
    );
  }
}
