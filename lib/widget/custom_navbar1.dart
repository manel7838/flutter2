// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:pfe/features/cart/bloc/cart_bloc.dart';
// import 'package:pfe/features/checkout/bloc/checkout_bloc.dart';
// import 'package:pfe/features/home/models/serveur_model.dart';


// class CustomNavBar extends StatelessWidget {
//   final String screen;
//   final Serveur? product;

//   const CustomNavBar({
//     Key? key,
//     required this.screen,
//     this.product,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BottomAppBar(
//       color: Colors.black,
//       child: Container(
//         height: 70,
//         child: (screen == '/product')
//             ? AddToCartNavBar(product: product!)
//             : (screen == '/cart')
//                 ? GoToCheckoutNavBar()
//                 : (screen == '/checkout')
//                     ? OrderNowNavBar()
//                     : HomeNavBar(),
//       ),
//     );
//   }
// }

// class HomeNavBar extends StatelessWidget {
//   const HomeNavBar({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         IconButton(
//           icon: Icon(Icons.home, color: Colors.white),
//           onPressed: () {
//             Navigator.pushNamed(context, '/');
//           },
//         ),
//         IconButton(
//           icon: Icon(Icons.shopping_cart, color: Colors.white),
//           onPressed: () {
//             Navigator.pushNamed(context, '/cart');
//           },
//         ),
//         IconButton(
//           icon: Icon(Icons.person, color: Colors.white),
//           onPressed: () {
//             Navigator.pushNamed(context, '/user');
//           },
//         )
//       ],
//     );
//   }
// }

// class AddToCartNavBar extends StatelessWidget {
//   const AddToCartNavBar({
//     Key? key,
//     required this.product,
//   }) : super(key: key);

//   final Serveur product;
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         IconButton(
//           icon: Icon(Icons.share, color: Colors.white),
//           onPressed: () {},
//         ),
//         BlocBuilder<CartBloc, CartState>(
//           builder: (context, state) {
//             if (state is CartLoading) {
//               return CircularProgressIndicator();
//             }
//             if (state is CartLoaded) {
//               return ElevatedButton(
//                 onPressed: () {
//                   context.read<CartBloc>().add(AddServeur(product));
//                   Navigator.pushNamed(context, '/cart');
//                 },
//                 style: ElevatedButton.styleFrom(
//                   shape: RoundedRectangleBorder(),
//                 ),
//                 child: Text(
//                   'ADD TO CART',
//                   style: Theme.of(context).textTheme.headline3,
//                 ),
//               );
//             }
//             return Text('Something went wrong!');
//           },
//         ),
//       ],
//     );
//   }
// }

// class GoToCheckoutNavBar extends StatelessWidget {
//   const GoToCheckoutNavBar({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         ElevatedButton(
//           onPressed: () {
//             Navigator.pushNamed(context, '/checkout');
//           },
//           style: ElevatedButton.styleFrom(
//             shape: RoundedRectangleBorder(),
//           ),
//           child: Text(
//             'GO TO CHECKOUT',
//             style: Theme.of(context).textTheme.headline3,
//           ),
//         ),
//       ],
//     );
//   }
// }

// class OrderNowNavBar extends StatelessWidget {
//   const OrderNowNavBar({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         BlocBuilder<CheckoutBloc, CheckoutState>(
//           builder: (context, state) {
//             if (state is CheckoutLoading) {
//               return Center(
//                 child: CircularProgressIndicator(
//                   color: Colors.white,
//                 ),
//               );
//             }
           
//           },
//         ),
//       ],
//     );
//   }
// }