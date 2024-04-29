import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pfe/features/checkout/bloc/checkout_bloc.dart';
import 'package:pfe/translations/locale_keys.g.dart';
//import 'package:pfe/widget/custom_appbar.dart';
import 'package:pfe/widget/custom_text_from_field.dart';
//import 'package:pfe/translations/codegen_loader.g.dart';

class CheckoutScreen extends StatelessWidget {
  static const String routeName = '/checkout';

  const CheckoutScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const CheckoutScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 21, 38, 229),
        title: Text(
          LocaleKeys.checkout.tr(),
          style: Theme.of(context)
              .textTheme
              .headlineLarge!
              .copyWith(color: Colors.black),
        ),
      ),
      //bottomNavigationBar: CustomNavBar(screen: routeName),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: BlocBuilder<CheckoutBloc, CheckoutState>(
          builder: (context, state) {
            if (state is CheckoutLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is CheckoutLoaded) {
              return SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      LocaleKeys.customer_information.tr(),
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    CustomTextFormField(
                      title: 'Email',
                      onChanged: (value) {
                        context
                            .read<CheckoutBloc>()
                            .add(UpdateCheckout(email: value));
                      },
                    ),
                    CustomTextFormField(
                      title: 'Full Name',
                      onChanged: (value) {
                        context
                            .read<CheckoutBloc>()
                            .add(UpdateCheckout(fullName: value));
                      },
                    ),
                    const SizedBox(height: 20),

                    CustomTextFormField(
                      title: 'Address',
                      onChanged: (value) {
                        context
                            .read<CheckoutBloc>()
                            .add(UpdateCheckout(address: value));
                      },
                    ),
                    CustomTextFormField(
                      title: 'City',
                      onChanged: (value) {
                        context
                            .read<CheckoutBloc>()
                            .add(UpdateCheckout(city: value));
                      },
                    ),
                    CustomTextFormField(
                      title: 'Country',
                      onChanged: (value) {
                        context
                            .read<CheckoutBloc>()
                            .add(UpdateCheckout(country: value));
                      },
                    ),
                    CustomTextFormField(
                      title: 'ZIP Code',
                      onChanged: (value) {
                        context
                            .read<CheckoutBloc>()
                            .add(UpdateCheckout(zipCode: value));
                      },
                    ),
                    const SizedBox(height: 20),
                    Container(
                      height: 60,
                      alignment: Alignment.bottomCenter,
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 40, 24, 185)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Text(
                    //   'ORDER SUMMARY',
                    //   style: Theme.of(context).textTheme.displaySmall,
                    // ),
                    // const OrderSummary()
                  ],
                ),
              );
            } else {
              return const Text('Something went wrong');
            }
          },
        ),
      ),
    );
  }
}
