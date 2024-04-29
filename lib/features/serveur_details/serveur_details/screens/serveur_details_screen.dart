import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pfe/features/cart/bloc/cart_bloc.dart';
import 'package:pfe/features/home/models/serveur_model.dart';
import 'package:pfe/translations/locale_keys.g.dart';

class ServeurDetailsScreen extends StatefulWidget {
  static const String routeName = '/serveur-details';
  final Serveur serveur;
  const ServeurDetailsScreen({
    super.key,
    required this.serveur,
  });

  @override
  State<ServeurDetailsScreen> createState() => _ServeurDetailsScreenState();
}

class _ServeurDetailsScreenState extends State<ServeurDetailsScreen> {
  double avgRating = 0;
  double myRating = 0;

  @override
  void initState() {
    super.initState();
  }

  void addToCart() {
    //  context.read<CartBloc>().add(AddProduct(widget.product));
    const snackBar =
        SnackBar(content: Text(' serveur successfully added to your cart'));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          backgroundColor: const Color.fromARGB(255, 21, 38, 229),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            iconSize: 20.0,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 10,
              ),
              child: Text(
                widget.serveur.name,
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
            Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),

                child: Image.network(widget.serveur.imageURL,
                    fit: BoxFit.cover, height: 200.0),
                // child: Text(serveur.name),
              ),
            ),
            Container(
              color: Colors.black12,
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: RichText(
                text: TextSpan(
                  text: 'Prix: ',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                      text: '${widget.serveur.price.toString()} DT',
                      style: const TextStyle(
                        fontSize: 22,
                        color: Colors.red,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(widget.serveur.description),
            ),
            Container(
              color: Colors.black12,
              height: 5,
            ),
            // Padding(
            //   padding: const EdgeInsets.all(10),
            //   child: CustomButton(
            //     title: 'Buy Now',
            //     onTap: () {},
            //   ),
            // ),
            const SizedBox(height: 10),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: BlocBuilder<CartBloc, CartState>(
                  builder: (context, state) {
                    if (state is CartLoading) {
                      return const CircularProgressIndicator();
                    }
                    if (state is CartLoaded) {
                      return ElevatedButton(
                        onPressed: () {
                          context
                              .read<CartBloc>()
                              .add(AddServeur(widget.serveur));
                          Navigator.pushNamed(context, '/cart');
                        },
                        style: ElevatedButton.styleFrom(
                          shape: const RoundedRectangleBorder(),
                        ),
                        child: Text(
                          LocaleKeys.add_to_cart.tr(),
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      );
                    }
                    return const Text('Something went wrong!');
                  },
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              color: Colors.black12,
              height: 5,
            ),
          ],
        ),
      ),
    );
  }
}
