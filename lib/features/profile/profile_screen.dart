import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pfe/features/profile/auth/auth_repository.dart';
import 'package:pfe/features/profile/blocs/auth/auth_bloc.dart';
import 'package:pfe/features/profile/profile/profile_bloc.dart';
import 'package:pfe/features/profile/user/user_repository.dart';
import 'package:pfe/translations/locale_keys.g.dart';

import 'package:pfe/widget/mycustom_text_from_field.dart';

class ProfileScreen extends StatelessWidget {
  static const String routeName = '/profile';

  const ProfileScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => BlocProvider<ProfileBloc>(
        create: (context) => ProfileBloc(
          authBloc: BlocProvider.of<AuthBloc>(context),
          userRepository: context.read<UserRepository>(),
        )..add(
            LoadProfile(context.read<AuthBloc>().state.authUser),
          ),
        child: const ProfileScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: CustomAppBar(title: 'Profile'),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 21, 38, 229),
        title: Text(
          LocaleKeys.myprofil.tr(),
          style: Theme.of(context)
              .textTheme
              .headlineLarge!
              .copyWith(color: Colors.black),
        ),
      ),
      // bottomNavigationBar: CustomNavBar(screen: routeName),
      body: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          if (state is ProfileLoading) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.black),
            );
          }
          if (state is ProfileLoaded) {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //
                  // Center(
                  //   child: Container(
                  //       height: 130,
                  //       width: 160,
                  //       decoration: BoxDecoration(
                  //         boxShadow: [
                  //           BoxShadow(
                  //             color: Colors.grey.withOpacity(0.7),
                  //             spreadRadius: 5,
                  //             blurRadius: 7,
                  //             offset: const Offset(
                  //                 0, 3), // changes position of shadow
                  //           ),
                  //         ],
                  //         shape: BoxShape.circle,
                  //       ),
                  //       child: Image.network(state.user.imageUrl,
                  //           fit: BoxFit.cover,
                  //           loadingBuilder: (context, child, loadingProgress) {
                  //         int? expSize;
                  //         int? dowSize;
                  //         expSize = loadingProgress?.expectedTotalBytes;
                  //         dowSize = loadingProgress?.cumulativeBytesLoaded;
                  //         if (expSize != null && dowSize != null) {
                  //           var loadPerc = (dowSize / expSize).toDouble() * 100;
                  //           var loadPercString = loadPerc.toStringAsFixed(2);
                  //           return Column(
                  //             children: [
                  //               Text(
                  //                 '$loadPercString%',
                  //                 style: Theme.of(context)
                  //                     .textTheme
                  //                     .displaySmall!
                  //                     .copyWith(color: Colors.red),
                  //               ),
                  //               const SizedBox(
                  //                 height: 10,
                  //               ),
                  //               LinearProgressIndicator(value: loadPerc),
                  //             ],
                  //           );
                  //         } else {
                  //           return child;
                  //         }
                  //       })),
                  // ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    LocaleKeys.personalInformation.tr(),
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(color: Colors.black),
                  ),
                  const SizedBox(height: 10),
                  MyCustomTextFormField(
                    title: LocaleKeys.email.tr(),
                    initialValue: state.user.email,
                    onChanged: (value) {
                      context.read<ProfileBloc>().add(
                            UpdateProfile(
                              user: state.user.copyWith(email: value),
                            ),
                          );
                    },
                  ),
                  const SizedBox(height: 5),
                  MyCustomTextFormField(
                    title: LocaleKeys.name.tr(),
                    initialValue: state.user.fullName,
                    onChanged: (value) {
                      context.read<ProfileBloc>().add(
                            UpdateProfile(
                              user: state.user.copyWith(fullName: value),
                            ),
                          );
                    },
                  ),
                  const SizedBox(height: 5),
                  MyCustomTextFormField(
                    title: LocaleKeys.adress.tr(),
                    initialValue: state.user.address,
                    onChanged: (value) {
                      context.read<ProfileBloc>().add(
                            UpdateProfile(
                              user: state.user.copyWith(address: value),
                            ),
                          );
                    },
                  ),
                  const SizedBox(height: 5),
                  MyCustomTextFormField(
                    title: LocaleKeys.city.tr(),
                    initialValue: state.user.city,
                    onChanged: (value) {
                      context.read<ProfileBloc>().add(
                            UpdateProfile(
                              user: state.user.copyWith(city: value),
                            ),
                          );
                    },
                  ),
                  const SizedBox(height: 5),
                  MyCustomTextFormField(
                    title: LocaleKeys.country.tr(),
                    initialValue: state.user.country,
                    onChanged: (value) {
                      context.read<ProfileBloc>().add(
                            UpdateProfile(
                              user: state.user.copyWith(country: value),
                            ),
                          );
                    },
                  ),
                  const SizedBox(height: 5),
                  MyCustomTextFormField(
                    title: LocaleKeys.phone.tr(),
                    initialValue: state.user.phone,
                    onChanged: (value) {
                      context.read<ProfileBloc>().add(
                            UpdateProfile(
                              user: state.user.copyWith(phone: value),
                            ),
                          );
                    },
                  ),
                  Expanded(child: Container()),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/home');
                      },
                      style: ElevatedButton.styleFrom(
                        shape: const RoundedRectangleBorder(),
                        //  primary: Colors.black,
                        fixedSize: const Size(200, 40),
                      ),
                      child: Text(
                        LocaleKeys.backtohome.tr(),
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
          if (state is ProfileUnauthenticated) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      'You are not logged in!',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/loginScreen');
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const RoundedRectangleBorder(),
                    // primary: Colors.black,
                    fixedSize: const Size(200, 40),
                  ),
                  child: Text(
                    'Login',
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                          color: Colors.white,
                        ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/signup');
                    context.read<AuthRepository>().signOut();
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const RoundedRectangleBorder(),
                    fixedSize: const Size(200, 40),
                  ),
                  child: Text(
                    'Signup',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
              ],
            );
          } else {
            return const Text('Something went wrong');
          }
        },
      ),
    );
  }
}
