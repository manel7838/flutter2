import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:pfe/features/cart/cart_model.dart';
import 'package:pfe/features/home/models/serveur_model.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartLoading()) {
    on<LoadCart>(_onLoadCart);
    on<AddServeur>(_onAddServeur);
    on<RemoveServeur>(_onRemoveServeur);
  }

  void _onLoadCart(
    LoadCart event,
    Emitter<CartState> emit,
  ) async {
    emit(CartLoading());
    try {
      await Future<void>.delayed(const Duration(seconds: 1));
      emit(const CartLoaded());
    } catch (_) {
      emit(CartError());
    }
  }

  void _onAddServeur(
    AddServeur event,
    Emitter<CartState> emit,
  ) {
    if (state is CartLoaded) {
      try {
        emit(
          CartLoaded(
            cart: Cart(
              serveurs: List.from((state as CartLoaded).cart.serveurs)
                ..add(event.serveur),
            ),
          ),
        );
      } on Exception {
        emit(CartError());
      }
    }
  }

  void _onRemoveServeur(
    RemoveServeur event,
    Emitter<CartState> emit,
  ) {
    if (state is CartLoaded) {
      try {
        emit(
          CartLoaded(
            cart: Cart(
              serveurs: List.from((state as CartLoaded).cart.serveurs)
                ..remove(event.serveur),
            ),
          ),
        );
      } on Exception {
        emit(CartError());
      }
    }
  }
}
