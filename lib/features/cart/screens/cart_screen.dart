import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pfe/features/cart/bloc/cart_bloc.dart';
import 'package:pfe/translations/locale_keys.g.dart';
import 'package:pfe/widget/custom_appbar.dart';
import 'package:pfe/widget/myserveur_cart.dart';
import 'package:pfe/translations/codegen_loader.g.dart';

class CartScreen extends StatelessWidget {
  static const String routeName = '/cart';

  const CartScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const CartScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 21, 38, 229),
        title: Text(
          LocaleKeys.cart.tr(),
          style: Theme.of(context)
              .textTheme
              .headlineLarge!
              .copyWith(color: Colors.black),
        ),
      ),
      // bottomNavigationBar: CustomNavBar(screen: routeName),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            );
          }
          if (state is CartLoaded) {
            Map cart = state.cart.productQuantity(state.cart.serveurs);

            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 10.0,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/');
                        },
                        style: ElevatedButton.styleFrom(
                          shape: const RoundedRectangleBorder(),
                          elevation: 0,
                        ),
                        child: Text(
                          'Add More Items',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 400,
                    child: ListView.builder(
                      itemCount: cart.keys.length,
                      itemBuilder: (BuildContext context, int index) {
                        return MyServeurCard.cart(
                          serveur: cart.keys.elementAt(index),
                          quantity: cart.values.elementAt(index),
                        );
                      },
                    ),
                  ),
                  //const OrderSummary(),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/checkout');
                    },
                    style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(),
                    ),
                    child: Text(
                      LocaleKeys.checkout.tr(),
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                  )
                ],
              ),
            );
          }
          return const Text('Something went wrong');
        },
      ),
    );
  }
}
