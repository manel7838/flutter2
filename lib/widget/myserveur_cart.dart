import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pfe/features/cart/bloc/cart_bloc.dart';
import 'package:pfe/features/home/models/serveur_model.dart';

class MyServeurCard extends StatelessWidget {
  const MyServeurCard.catalog({
    super.key,
    required this.serveur,
    this.quantity,
    this.widthFactor = 2.25,
    this.height = 150,
    this.isCatalog = true,
    this.isWishlist = false,
    this.isCart = false,
    this.isSummary = false,
    this.iconColor = Colors.white,
    this.fontColor = Colors.white,
  });

  const MyServeurCard.cart({
    super.key,
    required this.serveur,
    this.quantity,
    this.widthFactor = 2.25,
    this.height = 80,
    this.isCatalog = false,
    this.isWishlist = false,
    this.isCart = true,
    this.isSummary = false,
    this.iconColor = Colors.black,
    this.fontColor = Colors.black,
  });

  const MyServeurCard.summary({
    super.key,
    required this.serveur,
    this.quantity,
    this.widthFactor = 2.25,
    this.height = 80,
    this.isCatalog = false,
    this.isWishlist = false,
    this.isCart = false,
    this.isSummary = true,
    this.iconColor = Colors.black,
    this.fontColor = Colors.black,
  });

  final Serveur serveur;
  final int? quantity;
  final double widthFactor;
  final double height;
  final bool isCatalog;
  final bool isWishlist;
  final bool isCart;
  final bool isSummary;
  final Color iconColor;
  final Color fontColor;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double adjWidth = width / widthFactor;

    return InkWell(
      onTap: () {
        if (isCatalog || isWishlist) {
          Navigator.pushNamed(
            context,
            '/product',
            arguments: serveur,
          );
        }
      },
      child: isCart || isSummary
          ? Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Row(
                children: [
                  ProductImage(
                    adjWidth: 100,
                    height: height,
                    serveur: serveur,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ProductInformation(
                      product: serveur,
                      fontColor: fontColor,
                      quantity: quantity,
                      isOrderSummary: isSummary ? true : false,
                    ),
                  ),
                  const SizedBox(width: 10),
                  ProductActions(
                    product: serveur,
                    isCatalog: isCatalog,
                    isWishlist: isWishlist,
                    isCart: isCart,
                    iconColor: iconColor,
                    quantity: quantity,
                  )
                ],
              ),
            )
          : Stack(
              alignment: Alignment.bottomCenter,
              children: [
                ProductImage(
                  adjWidth: adjWidth,
                  height: height,
                  serveur: serveur,
                ),
                ProductBackground(
                  adjWidth: adjWidth,
                  widgets: [
                    ProductInformation(
                      product: serveur,
                      fontColor: fontColor,
                    ),
                    ProductActions(
                      product: serveur,
                      isCatalog: isCatalog,
                      isWishlist: isWishlist,
                      isCart: isCart,
                      iconColor: iconColor,
                    )
                  ],
                ),
              ],
            ),
    );
  }
}

class ProductImage extends StatelessWidget {
  const ProductImage({
    super.key,
    required this.adjWidth,
    required this.height,
    required this.serveur,
  });

  final double adjWidth;
  final double height;
  final Serveur serveur;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: adjWidth,
      height: height,
      child: Image.network(
        serveur.imageURL,
        fit: BoxFit.cover,
      ),
    );
  }
}

class ProductInformation extends StatelessWidget {
  const ProductInformation({
    super.key,
    required this.product,
    required this.fontColor,
    this.isOrderSummary = false,
    this.quantity,
  });

  final Serveur product;
  final Color fontColor;
  final bool isOrderSummary;
  final int? quantity;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 85,
              child: Text(
                product.name,
                maxLines: 1,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(color: fontColor),
              ),
            ),
            Text(
              '\$${product.price}',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: fontColor),
            ),
          ],
        ),
        isOrderSummary
            ? Text(
                'Qty. $quantity',
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(color: fontColor),
              )
            : const SizedBox(),
      ],
    );
  }
}

class ProductActions extends StatelessWidget {
  const ProductActions({
    super.key,
    required this.product,
    required this.isCatalog,
    required this.isWishlist,
    required this.isCart,
    required this.iconColor,
    this.quantity,
  });

  final Serveur product;
  final bool isCatalog;
  final bool isWishlist;
  final bool isCart;
  final Color iconColor;
  final int? quantity;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state is CartLoading) {
          return const Center(
            child: CircularProgressIndicator(color: Colors.white),
          );
        }
        if (state is CartLoaded) {
          IconButton addProduct = IconButton(
            icon: Icon(
              Icons.add_circle,
              color: iconColor,
            ),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Added to your Cart!'),
                ),
              );
              context.read<CartBloc>().add(AddServeur(product));
            },
          );

          IconButton removeProduct = IconButton(
            icon: Icon(
              Icons.remove_circle,
              color: iconColor,
            ),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Removed from your Cart!'),
                ),
              );
              context.read<CartBloc>().add(RemoveServeur(product));
            },
          );

          if (isWishlist) {
            return const Text('');
          } else if (isCart) {
            return const Text('');
          } else {
            return const SizedBox();
          }
        } else {
          return const Text('Something went wrong.');
        }
      },
    );
  }
}

class ProductBackground extends StatelessWidget {
  const ProductBackground({
    super.key,
    required this.adjWidth,
    required this.widgets,
  });

  final double adjWidth;
  final List<Widget> widgets;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: adjWidth - 10,
      height: 80,
      margin: const EdgeInsets.only(bottom: 5),
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(color: Colors.black.withAlpha(50)),
      child: Container(
        width: adjWidth - 20,
        height: 70,
        margin: const EdgeInsets.only(bottom: 5),
        alignment: Alignment.bottomCenter,
        decoration: const BoxDecoration(color: Colors.black),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [...widgets],
          ),
        ),
      ),
    );
  }
}
