// ignore: unused_import
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pfe/features/home/blocs/serveur_bloc.dart';
import 'package:pfe/features/home/blocs/serveur_state.dart';

import 'package:pfe/features/home/fonctionaliter_screen.dart';
import 'package:pfe/widget/custom_navbar.dart';
import 'package:pfe/widget/serveur_card.dart';
// ignore: depend_on_referenced_packages
import 'package:file_picker/file_picker.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
  Future<void> pickFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles();

      if (result != null) {
        PlatformFile file = result.files.first;

        // Use the selected file (e.g., file.path)
        print('File path: ${file.path}');
      } else {
        // User canceled the picker
        print('User canceled the picker');
      }
    } catch (e) {
      // Handle any exceptions
      print('Error picking file: $e');
    }
  }
}

class _HomeScreenState extends State<HomeScreen> {
  Future<void> pickFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles();

      if (result != null) {
        PlatformFile file = result.files.first;

        // Use the selected file (e.g., file.path)
        print('File path: ${file.path}');
      } else {
        // User canceled the picker
        print('User canceled the picker');
      }
    } catch (e) {
      // Handle any exceptions
      print('Error picking file: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //curvednavigation:

      bottomNavigationBar: const CustomNavBar(),

      //appbar:
      backgroundColor: Colors.white,
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 21, 38, 229),
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30))),
            child: Column(children: [
              const SizedBox(
                height: 40,
              ),
              ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 30),
                title: Text(
                  "Acceuil",
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(color: Colors.white),
                ),
                subtitle: Text(
                  "NOTRE AGENCE D’EMAILING TUNISIE ",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(color: Colors.white54),
                ),
                trailing: const CircleAvatar(
                  maxRadius: 50,
                  backgroundImage: AssetImage("assets/images/logo2.png"),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
            ]),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 40),
            child: Text(
              "Campagne emailing tunisie avec Mailwizz",
              style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 25,
                  fontStyle: FontStyle.italic,
                  color: Color.fromARGB(255, 79, 78, 78)),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.h),
            child: const Text(
              "L’emailing est un formidable moyen pour fidéliser et informer rapidement un grand nombre de personnes. Cependant l’emailing est souvent mal utilisé et donc n’apporte pas les résultats escomptés. La première étape consiste à utiliser un logiciel professionnel dédié à cette pratique. Après un comparatif et de nombreux tests nous avons opté pour le logiciel Mailwizz.",
              style:
                  TextStyle(fontSize: 17, color: Color.fromARGB(255, 0, 0, 0)),
              //textAlign: TextAlign.center,
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(top: 10),
              child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const FonctionaliterScreen()));
                  },
                  child: const Text(
                    "Plus de détails",
                    style: TextStyle(color: Colors.red, fontSize: 15),
                  ))),
          const Padding(
            padding: EdgeInsets.only(top: 20),
            child: Text(
              "Nos packs Serveur Mailing",
              style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 25,
                  fontStyle: FontStyle.italic,
                  color: Color.fromARGB(255, 79, 78, 78)),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          //Gridview:
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              alignment: Alignment.topCenter,
              // color: Colors.blue,
              width: double.infinity,
              height: 490.h,
              child: BlocBuilder<ServeurBloc, ServeurState>(
                  builder: (context, state) {
                print(state);
                if (state is ServeurLoading) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  );
                }
                if (state is ServeurLoaded) {
                  return GridView.builder(
                    itemCount: state.serveurs.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 5,
                    ),
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: ServeurCard(serveur: state.serveurs[index]),
                    ),
                  );
                } else {
                  return const Text('Something went wrong.');
                }
              }),
            ),
          ),
        ],
      ),
    );
  }

  InputDecoration _buildInputDecoration(String label) {
    return InputDecoration(
        fillColor: const Color.fromARGB(255, 252, 255, 254),
        enabledBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(color: Color.fromARGB(255, 124, 137, 136)),
            borderRadius: BorderRadius.circular(30.0)),
        filled: true,
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0)));
  }
}
