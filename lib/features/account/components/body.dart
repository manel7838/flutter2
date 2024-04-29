import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pfe/features/profile/auth/auth_repository.dart';
import 'package:pfe/translations/locale_keys.g.dart';

import 'profile_menu.dart';

// ignore: must_be_immutable
class Body extends StatelessWidget {
  FirebaseAuth auth = FirebaseAuth.instance;
  String uid = FirebaseAuth.instance.currentUser!.uid.toString();

  Body({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          //  ProfilePic(),

          const SizedBox(height: 20),
          ProfileMenu(
            text: LocaleKeys.myprofil.tr(),
            icon: "assets/icons/User Icon.svg",
            press: () => {Navigator.pushNamed(context, '/profile')},
          ),
          ProfileMenu(
            text: LocaleKeys.notif.tr(),
            icon: "assets/icons/Bell.svg",
            press: () {},
          ),

          ProfileMenu(
            text: LocaleKeys.help.tr(),
            icon: "assets/icons/Question mark.svg",
            press: () {},
          ),
          ProfileMenu(
            text: LocaleKeys.logout.tr(),
            icon: "assets/icons/Log out.svg",
            press: () async {
              context.read<AuthRepository>().signOut();
              Navigator.pushNamed(context, '/home');

//                   BlocProvider.of<UserBloc>(context).add(LogoutEvent());

//  //SharedPreferences pref = await SharedPreferences.getInstance();
//  int userId = pref.getInt('id');
//         String token = pref.getString("token");
//        print(token);
//                   if(state is LogoutState){
//                   Navigator.push(context, MaterialPageRoute(builder: (context) {
//                     return SignInScreen();
//                   }));
//                   }
            },
          ),
        ],
      ),
    );
  }
}
