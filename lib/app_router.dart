import 'package:flutter/material.dart';
import 'package:pfe/features/account/account_screen.dart';
import 'package:pfe/features/cart/screens/cart_screen.dart';
import 'package:pfe/features/checkout/checkout_screen.dart';
import 'package:pfe/features/home/home_screen.dart';
import 'package:pfe/features/home/models/serveur_model.dart';
import 'package:pfe/features/login/login_screen.dart';
import 'package:pfe/features/onboarding/onboarding_screen.dart';
import 'package:pfe/features/profile/profile_screen.dart';
import 'package:pfe/features/serveur_details/serveur_details/screens/serveur_details_screen.dart';
import 'package:pfe/features/signup/signup_screen.dart';
import 'package:pfe/widget/contact_us.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/splash':
        return MaterialPageRoute(
          builder: (_) => const OnBoarding(),
        );
      case '/signup':
        return MaterialPageRoute(
          builder: (_) => const SignupScreen(),
        );
      case '/login':
        return MaterialPageRoute(
          builder: (_) => LoginScreen(),
        );
      case '/home':
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      case '/ServeurDetails':
        return MaterialPageRoute(
          builder: (_) => ServeurDetailsScreen(
            serveur: settings.arguments as Serveur,
          ),
        );
      case '/cart':
        return MaterialPageRoute(
          builder: (_) => const CartScreen(),
        );
      case '/account':
        return MaterialPageRoute(
          builder: (_) => const AccountScreen(),
        );
      case '/profile':
        return MaterialPageRoute(
          builder: (_) => const ProfileScreen(),
        );
      case '/checkout':
        return MaterialPageRoute(
          builder: (_) => const CheckoutScreen(),
        );
      case '/contactInformation':
        return MaterialPageRoute(
          builder: (_) => const ContactInformation(),
        );
    }

    return null;
  }
}
