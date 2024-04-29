import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pfe/app_router.dart';
import 'package:pfe/features/cart/bloc/cart_bloc.dart';
import 'package:pfe/features/checkout/bloc/checkout_bloc.dart';
import 'package:pfe/features/checkout/checkout_repository.dart';
import 'package:pfe/features/cubits/login/login_cubit.dart';
import 'package:pfe/features/cubits/signup/signup_cubit.dart';
import 'package:pfe/features/home/blocs/serveur_bloc.dart';
import 'package:pfe/features/home/blocs/serveur_event.dart';
import 'package:pfe/features/home/home_screen.dart';
import 'package:pfe/features/home/repositories/serveur_repository.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
//import 'package:pfe/features/onboarding/onboarding_screen.dart';
import 'package:pfe/features/profile/auth/auth_repository.dart';
import 'package:pfe/features/profile/blocs/auth/auth_bloc.dart';
import 'package:pfe/features/profile/profile/profile_bloc.dart';
import 'package:pfe/features/profile/user/user_repository.dart';
import 'package:pfe/features/services/storage_service.dart';
//import 'package:pfe/features/signup/signup_screen.dart';
import 'package:pfe/translations/codegen_loader.g.dart';

//import 'package:pfe/features/sign_up.dart';
//import 'package:pfe/features/login.dart';
//import 'firebase_options.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.black26));
  await EasyLocalization.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  runApp(EasyLocalization(
      path: 'assets/translations',
      // ignore: prefer_const_literals_to_create_immutables
      supportedLocales: [
        const Locale('en'),
        const Locale('ar'),
        const Locale('fr'),
        const Locale('de'),
      ],
      fallbackLocale: const Locale('en'),
      assetLoader: const CodegenLoader(),
      child: MyApp(
        appRouter: AppRouter(),
      )));
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.appRouter,
  });
  final AppRouter appRouter;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => UserRepository(),
        ),
        RepositoryProvider(
          create: (context) => AuthRepository(
            userRepository: context.read<UserRepository>(),
          ),
        ),
        RepositoryProvider(
          create: (context) => StorageRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => SignupCubit(
              authRepository: context.read<AuthRepository>(),
            ),
          ),
          BlocProvider(
            create: (context) => LoginCubit(
              authRepository: context.read<AuthRepository>(),
            ),
          ),
          BlocProvider(
            create: (context) =>
                ServeurBloc(serveurRepository: ServeurRepository())
                  ..add(const LoadServeurs()),
          ),
          BlocProvider(
            create: (_) => CartBloc()..add(LoadCart()),
          ),
          BlocProvider(
            create: (context) => CheckoutBloc(
              cartBloc: context.read<CartBloc>(),
              checkoutRepository: CheckoutRepository(),
            ),
          ),
          BlocProvider(
            create: (context) => AuthBloc(
                authRepository: context.read<AuthRepository>(),
                userRepository: context.read<UserRepository>(),
                storageRepository: context.read<StorageRepository>()),
          ),
          BlocProvider(
            create: (context) => AuthBloc(
                authRepository: context.read<AuthRepository>(),
                userRepository: context.read<UserRepository>(),
                storageRepository: context.read<StorageRepository>()),
          ),
          BlocProvider(
            create: (context) => ProfileBloc(
              authBloc: BlocProvider.of<AuthBloc>(context),
              userRepository: context.read<UserRepository>(),
            )..add(
                LoadProfile(auth.FirebaseAuth.instance.currentUser),
              ),
          ),
        ],
        child: ScreenUtilInit(
            designSize: const Size(375, 812),
            minTextAdapt: true,
            child: MaterialApp(
              supportedLocales: context.supportedLocales,
              localizationsDelegates: context.localizationDelegates,
              locale: context.locale,
              debugShowCheckedModeBanner: false,
              onGenerateRoute: appRouter.generateRoute,
              home: const HomeScreen(),
              routes: {
                "home_screen": (context) => const HomeScreen(),
              },
            )),
      ),
    );
  }
}
